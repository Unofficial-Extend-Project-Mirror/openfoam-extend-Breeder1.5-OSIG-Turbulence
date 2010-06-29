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

Class
    Foam::incompressible::RASModels::qOmega

Description
    Coakley's q-omega turbulence model for incompressible flows.

    @verbatim
        Coakley, T.J.
        "Turbulence modeling methods for the compressible
        Navier-Stokes equations"
        AIAA Paper 83-1693, July 1983.

        Coakley, T.J. and Hsieh, T.
        "A comparison between implicit and hybrid methods for
        calculation of steady and unsteady inlet flows"
        AIAA Paper 85-1125, July 1985.
    @endverbatim

    The default model coefficients correspond to the following:
    @verbatim
        qOmegaCoeffs
        {
            alpha       0.02;
            Cmu         0.09;
            C11         0.055;
            C12         0.5;
            C2          0.833;
            alphaQ      0.5;
            alphaOmega  0.5;
        }
    @endverbatim

SourceFiles
    qOmega.C

Author
    David A. Boger, Penn State Applied Research Laboratory
    All rights reserved


\*---------------------------------------------------------------------------*/

#ifndef qOmega_H
#define qOmega_H

#include "RASModel.H"
#include "wallDist.H"

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

namespace Foam
{
namespace incompressible
{
namespace RASModels
{

/*---------------------------------------------------------------------------*\
                           Class qOmega Declaration
\*---------------------------------------------------------------------------*/

class qOmega
:
    public RASModel
{
    // Private data

        // Model coefficients

            dimensionedScalar alpha_;
            dimensionedScalar Cmu_;
            dimensionedScalar C11_;
            dimensionedScalar C12_;
            dimensionedScalar C2_;
            dimensionedScalar alphaQ_;
            dimensionedScalar alphaOmega_;

            dimensionedScalar omegaSmall_;


        // Fields

            volScalarField q_;
            volScalarField omega_;
            volScalarField nut_;

            wallDist y_;

        // Private member functions

            tmp<volScalarField> c1() const;
            tmp<volScalarField> fw() const;

public:

    //- Runtime type information
    TypeName("qOmega");

    // Constructors

        //- Construct from components
        qOmega
        (
            const volVectorField& U,
            const surfaceScalarField& phi,
            transportModel& transport
        );


    // Destructor

        ~qOmega()
        {}


    // Member Functions

        //- Return the turbulence viscosity
        tmp<volScalarField> nut() const
        {
            return nut_;
        }

        //- Return the effective diffusivity for q
        tmp<volScalarField> DqEff() const
        {
            return tmp<volScalarField>
            (
                new volScalarField("DqEff", alphaQ_*nut_ + nu())
            );
        }

        //- Return the effective diffusivity for omega
        tmp<volScalarField> DomegaEff() const
        {
            return tmp<volScalarField>
            (
                new volScalarField("DomegaEff", alphaOmega_*nut_ + nu())
            );
        }

        //- Return the turbulence kinetic energy
        tmp<volScalarField> k() const
        {
            return tmp<volScalarField>
            (
                new volScalarField
                (
                    IOobject
                    (
                        "k",
                        mesh_.time().timeName(),
                        mesh_
                    ),
                    sqr(q_),
                    q_.boundaryField().types()
                )
            );
        }

        tmp<volScalarField> q() const
        {
            return q_;
        }

        //- Return the turbulence kinetic energy dissipation rate
        tmp<volScalarField> epsilon() const
        {
            return tmp<volScalarField>
            (
                new volScalarField
                (
                    IOobject
                    (
                        "epsilon",
                        mesh_.time().timeName(),
                        mesh_
                    ),
                    omega_*k(),
                    omega_.boundaryField().types()
                )
            );
        }

        tmp<volScalarField> omega() const
        {
            return omega_;
        }

        //- Return the Reynolds stress tensor
        tmp<volSymmTensorField> R() const;

        //- Return the effective stress tensor including the laminar stress
        tmp<volSymmTensorField> devReff() const;

        //- Return the source term for the momentum equation
        tmp<fvVectorMatrix> divDevReff(volVectorField& U) const;

        //- Solve the turbulence equations and correct the turbulence viscosity
        void correct();

        //- Read turbulenceProperties dictionary
        bool read();
};


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

} // End namespace RASModels
} // End namespace incompressible
} // End namespace Foam

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

#endif

// ************************************************************************* //
