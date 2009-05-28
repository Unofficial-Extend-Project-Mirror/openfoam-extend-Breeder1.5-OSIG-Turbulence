/*---------------------------------------------------------------------------*\
  =========                 |
  \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\    /   O peration     |
    \\  /    A nd           | Copyright (C) Original author
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
    Foam::incompressible::RASModels::kOmegaSST

Description
    This is the original kOmegaSST model (from OpenFOAM-1.4)
    with the Gyllenram and Nilsson filter, described in
    Gyllenram, W.; Nilsson, H.: Design and Validation of a Scale-Adaptive
    Filtering Technique for LRN Turbulence Modeling of Unsteady Flow.
    Journal of Fluid Engineering, Volume 130 (Issue 5)
    This should be included in the references if the model is used.

    NOTE that this filter only makes sense for unsteady simulations,
    with a large separation between the small (modelled) turbulence scales,
    and the large resolved unsteadiness!!!

    The first simulation with OpenFOAM was presented in
    Nilsson, H; Gyllenram, W.: Experiences with OpenFOAM for water turbine
    applications. Proceedings of the 1st OpenFOAM International Conference,
    26-27 November 2007, Beaumont House, Old Windsor, United Kingdom.

    The model is also described and used in:
    Gyllenram, W; Nilsson, H: Very Large Eddy Simulation of Draft Tube Flow,
    23rd IAHR Symposium, Yokohama, October 2006

    Gyllenram, W: Analytical and Numerical Studies of Internal Swirling Flow,
    Thesis for the degree of doctor of philosophy, Chalmers University of
    Technology, 2008.

    Gyllenram, W; Stein, P.; Nilsson, H: Assessment of a hybrid LES/RANS
    turbulence model in unsteady swirling and recirculating flow.
    Submitted for journal publication 2008.

Authors (in OpenFOAM)
    Hakan Nilsson, Chalmers

\*---------------------------------------------------------------------------*/

#ifndef kOmegaSSTF_H
#define kOmegaSSTF_H

#include "fvMesh.H"
#include "Time.H"
#include "DimensionedField.H"
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
                           Class kOmega Declaration
\*---------------------------------------------------------------------------*/

class kOmegaSSTF
:
    public RASModel
{
    // Private data

        dimensionedScalar alphaK1_;
        dimensionedScalar alphaK2_;

        dimensionedScalar alphaOmega1_;
        dimensionedScalar alphaOmega2_;

        dimensionedScalar gamma1_;
        dimensionedScalar gamma2_;

        dimensionedScalar beta1_;
        dimensionedScalar beta2_;

        dimensionedScalar betaStar_;

        dimensionedScalar a1_;
        dimensionedScalar c1_;

        dimensionedScalar omega0_;
        dimensionedScalar omegaSmall_;

        dimensionedScalar Cmu_;

        wallDist y_;

        volScalarField k_;
        volScalarField omega_;
        volScalarField nut_;


    // Private member functions

        tmp<volScalarField> F1(const volScalarField& CDkOmega) const;
        tmp<volScalarField> F2() const;

        tmp<volScalarField> blend
        (
            const volScalarField& F1,
            const dimensionedScalar& psi1,
            const dimensionedScalar& psi2
        ) const
        {
            return F1*(psi1 - psi2) + psi2;
        }

        tmp<volScalarField> alphaK
        (
            const volScalarField& F1
        ) const
        {
            return blend(F1, alphaK1_, alphaK2_);
        }

        tmp<volScalarField> alphaOmega
        (
            const volScalarField& F1
        ) const
        {
            return blend(F1, alphaOmega1_, alphaOmega2_);
        }

        tmp<volScalarField> beta
        (
            const volScalarField& F1
        ) const
        {
            return blend(F1, beta1_, beta2_);
        }

        tmp<volScalarField> gamma
        (
            const volScalarField& F1
        ) const
        {
            return blend(F1, gamma1_, gamma2_);
        }


public:

    //- Runtime type information
    TypeName("kOmegaSSTF");


    // Constructors

        //- Construct from components
        kOmegaSSTF
        (
            const volVectorField& U,
            const surfaceScalarField& phi,
            transportModel& transport
        );


    // Destructor

        ~kOmegaSSTF()
        {}


    // Member Functions

        //- Return the turbulence viscosity
        tmp<volScalarField> nut() const
        {
            return nut_;
        }

        //- Return the effective diffusivity for k
        tmp<volScalarField> DkEff(const volScalarField& F1) const
        {
            return tmp<volScalarField> 
            (
                new volScalarField("DkEff", alphaK(F1)*nut_ + nu())
            );
        }

        //- Return the effective diffusivity for omega
        tmp<volScalarField> DomegaEff(const volScalarField& F1) const
        {
            return tmp<volScalarField> 
            (
                new volScalarField("DomegaEff", alphaOmega(F1)*nut_ + nu())
            );
        }

        //- Return the turbulence kinetic energy
        tmp<volScalarField> k() const
        {
            return k_;
        }

        tmp<volScalarField> omega() const
        {
            return omega_;
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
                    betaStar_*k_*omega_,
                    omega_.boundaryField().types()
                )
            );
        }

        //- Return the Reynolds stress tensor
        tmp<volSymmTensorField> R() const;

        //- Return the effective stress tensor including the laminar stress
        tmp<volSymmTensorField> devReff() const;

        //- Return the source term for the momentum equation
        tmp<fvVectorMatrix> divDevReff(volVectorField& U) const;

        //- Solve the turbulence equations and correct the turbulence viscosity
        void correct();

        const scalarField filter();

        //- Read turbulenceProperties dictionary
        bool read();
};


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

} // End namespace RASModels
} // namespace incompressible
} // End namespace Foam

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

#endif

// ************************************************************************* //
