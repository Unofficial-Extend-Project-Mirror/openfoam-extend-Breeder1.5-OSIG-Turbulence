/*---------------------------------------------------------------------------*\
  =========                 |
  \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\    /   O peration     |
    \\  /    A nd           | Copyright held by original author
     \\/     M anipulation  |
-------------------------------------------------------------------------------
License
    This file is part of OpenFOAM.

    OpenFOAM is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the
    Free Software Foundation; either version 2 of the License, or (at your
    option) any later version.

    OpenFOAM is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License
    along with OpenFOAM; if not, write to the Free Software Foundation,
    Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

\*---------------------------------------------------------------------------*/

#include "qOmega.H"
#include "addToRunTimeSelectionTable.H"
#include "wallDist.H"

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

namespace Foam
{
namespace incompressible
{
namespace RASModels
{

// * * * * * * * * * * * * * * Static Data Members * * * * * * * * * * * * * //

defineTypeNameAndDebug(qOmega, 0);
addToRunTimeSelectionTable(RASModel, qOmega, dictionary);

// * * * * * * * * * * * * Private Member Functions  * * * * * * * * * * * * //

tmp<volScalarField> qOmega::fw() const
{
    return 1 - exp (-alpha_ * y_ * q_ / nu());
}

tmp<volScalarField> qOmega::c1() const
{
    return C11_ + C12_ * fw();
}

// * * * * * * * * * * * * * * * * Constructors  * * * * * * * * * * * * * * //

// Construct from components
qOmega::qOmega
(
    const volVectorField& U,
    const surfaceScalarField& phi,
    transportModel& lamTransportModel
)
:
    RASModel(typeName, U, phi, lamTransportModel),

    alpha_
    (
        dimensioned<scalar>::lookupOrAddToDict
        (
            "alpha",
            coeffDict_,
            0.02
        )
    ),
    Cmu_
    (
        dimensioned<scalar>::lookupOrAddToDict
        (
            "Cmu",
            coeffDict_,
            0.09
        )
    ),
    C11_
    (
        dimensioned<scalar>::lookupOrAddToDict
        (
            "C11",
            coeffDict_,
            0.055
        )
    ),
    C12_
    (
        dimensioned<scalar>::lookupOrAddToDict
        (
            "C12",
            coeffDict_,
            0.5
        )
    ),
    C2_
    (
        dimensioned<scalar>::lookupOrAddToDict
        (
            "C2",
            coeffDict_,
            0.833
        )
    ),
    alphaQ_
    (
        dimensioned<scalar>::lookupOrAddToDict
        (
            "alphaQ",
            coeffDict_,
            0.5
        )
    ),
    alphaOmega_
    (
        dimensioned<scalar>::lookupOrAddToDict
        (
            "alphaOmega",
            coeffDict_,
            0.5
        )
    ),
    omegaSmall_("omegaSmall", dimless/dimTime, SMALL),


    q_
    (
        IOobject
        (
            "q",
            runTime_.timeName(),
            mesh_,
            IOobject::MUST_READ,
            IOobject::AUTO_WRITE
        ),
        mesh_
    ),

    omega_
    (
        IOobject
        (
            "omega",
            runTime_.timeName(),
            mesh_,
            IOobject::MUST_READ,
            IOobject::AUTO_WRITE
        ),
        mesh_
    ),

    nut_(Cmu_*sqr(q_)/(omega_ + omegaSmall_)),

    y_(mesh_)

{
    printCoeffs();
}


// * * * * * * * * * * * * * * * Member Functions  * * * * * * * * * * * * * //

tmp<volSymmTensorField> qOmega::R() const
{
    return tmp<volSymmTensorField>
    (
        new volSymmTensorField
        (
            IOobject
            (
                "R",
                runTime_.timeName(),
                mesh_,
                IOobject::NO_READ,
                IOobject::NO_WRITE
            ),
            ((2.0/3.0)*I)*k() - nut_*twoSymm(fvc::grad(U_)),
            q_.boundaryField().types()
        )
    );
}


tmp<volSymmTensorField> qOmega::devReff() const
{
    return tmp<volSymmTensorField>
    (
        new volSymmTensorField
        (
            IOobject
            (
                "devRhoReff",
                runTime_.timeName(),
                mesh_,
                IOobject::NO_READ,
                IOobject::NO_WRITE
            ),
           -nuEff()*dev(twoSymm(fvc::grad(U_)))
        )
    );
}


tmp<fvVectorMatrix> qOmega::divDevReff(volVectorField& U) const
{
    return
    (
      - fvm::laplacian(nuEff(), U)
      - fvc::div(nuEff()*dev(fvc::grad(U)().T()))
    );
}


bool qOmega::read()
{
    if (RASModel::read())
    {
        alpha_.readIfPresent(coeffDict_);
        Cmu_.readIfPresent(coeffDict_);
        C11_.readIfPresent(coeffDict_);
        C12_.readIfPresent(coeffDict_);
        C2_.readIfPresent(coeffDict_);
        alphaQ_.readIfPresent(coeffDict_);
        alphaOmega_.readIfPresent(coeffDict_);

        return true;
    }
    else
    {
        return false;
    }
}


void qOmega::correct()
{
    transportModel_.correct();

    if (!turbulence_)
    {
        return;
    }

    RASModel::correct();

    if (mesh_.changing())
    {
        y_.correct();
    }

    volScalarField c1 = this->c1();

    volScalarField sri = 2*magSqr(symm(fvc::grad(U_)));

    // Dissipation equation
    tmp<fvScalarMatrix> omegaEqn
    (
        fvm::ddt(omega_)
      + fvm::div(phi_, omega_)
      - fvm::laplacian(DomegaEff(), omega_)
     ==
        c1*Cmu_*sri
      - fvm::Sp(C2_*omega_, omega_)
    );

    omegaEqn().relax();

    solve(omegaEqn);
    //omega_ = max(omega_, 0.4108*q_/y_);
    omega_ = max(omega_, 0*q_/y_);


    // Turbulent kinetic energy equation
    tmp<fvScalarMatrix> qEqn
    (
        fvm::ddt(q_)
      + fvm::div(phi_, q_)
      - fvm::laplacian(DqEff(), q_)
     ==
        0.5 * q_ * Cmu_ * fw() * sri / omega_
      - fvm::Sp( 0.5*omega_, q_)
    );

    qEqn().relax();
    solve(qEqn);
    q_ = max(q_, 0.0*q_);


    // Re-calculate viscosity
    nut_ = Cmu_*fw()*sqr(q_)/(omega_ + omegaSmall_);

}


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

} // End namespace RASModels
} // End namespace incompressible
} // End namespace Foam

// ************************************************************************* //
