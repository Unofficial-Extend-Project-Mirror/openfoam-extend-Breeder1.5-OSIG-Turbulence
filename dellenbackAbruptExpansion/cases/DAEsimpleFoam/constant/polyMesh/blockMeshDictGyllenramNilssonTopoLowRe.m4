/*---------------------------------------------------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  1.5                                   |
|   \\  /    A nd           | Web:      http://www.openfoam.org               |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/

FoamFile
{
    version         2.0;
    format          ascii;
    class           dictionary;
    object          blockMeshDict;
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

// 090512: Original files by Håkan Nilsson, Chalmers University of Technology
//         Resembles the topology of the mesh used for the simulations for
//         the paper by Gyllenram and Nilsson, JFE, Vol.130, 2008, and
//         the paper by Nilsson and Gyllenram, 1st OpenFOAM conference.

//m4 definitions:
m4_changecom(//)m4_changequote([,])
m4_define(calc, [m4_esyscmd(perl -e 'use Math::Trig; printf ($1)')])
m4_define(VCOUNT, 0)
m4_define(vlabel, [[// ]Vertex $1 = VCOUNT m4_define($1, VCOUNT)m4_define([VCOUNT], m4_incr(VCOUNT))])

//Mathematical constants:
m4_define(pi, 3.1415926536)

//Geometry
m4_define(rIn, 25.39) //Small radius
m4_define(rOut, 49.25) //Large radius
//(corresponds to a ratio 1.9397, as in the paper by Gyllenram and Nilsson,
// Journal of Fluids Engineering, Vol.130, 2008)

//Number of cells:
//Radial direction:
m4_define(rNumberOfCells1st, 21)  // in the first O-grid
m4_define(rNumberOfCells2nd, 11)  // in the second O-grid
m4_define(rNumberOfCells3rd, 11)  // in the third O-grid
//Tangential direction:
m4_define(tNumberOfCells, 42)
//Axial direction:
m4_define(zABnumberOfCells, 67)
m4_define(zBCnumberOfCells, 11)
m4_define(zCDnumberOfCells, 11)
m4_define(zDEnumberOfCells, 10)
m4_define(zEFnumberOfCells, 36)
m4_define(zFGnumberOfCells, 8)
m4_define(zGHnumberOfCells, 59)

//Radial grading:
m4_define(rGrading1A, 4)
m4_define(rGrading1B, 4)
m4_define(rGrading2B, 0.0473)
m4_define(rGrading3B, 10.62699)
m4_define(rGrading1C, 2.5)
m4_define(rGrading2C, 0.410)
m4_define(rGrading2C, 0.410)
m4_define(rGrading3C, 4.4248)
m4_define(rGrading1D, 2.5)
m4_define(rGrading2D, 0.410)
m4_define(rGrading3D, 2)
m4_define(rGrading1E, 2.5)
m4_define(rGrading2E, 0.677)
m4_define(rGrading3E, 1.692)
m4_define(rGrading1F, 2.5)
m4_define(rGrading2F, 0.699)
m4_define(rGrading3F, 1.692)
m4_define(rGrading1G, 2.5)
m4_define(rGrading2G, 1.005)
m4_define(rGrading3G, 1.692)
m4_define(rGrading1H, 2.5)
m4_define(rGrading2H, 1.005)
m4_define(rGrading3H, 1.692)

//Axial grading:
m4_define(zGradingAB, 0.45869)
m4_define(zGradingBC, 3.40076)
m4_define(zGradingCD, 0.29405)
m4_define(zGradingDE, 1)
m4_define(zGradingEF, 4.01606)
m4_define(zGradingFG, 1.04167)
m4_define(zGradingGH, 1.12867)

//Plane A:
m4_define(zA, -101.56)
m4_define(rA, rIn)
m4_define(rRelA, 0.724)
m4_define(rRelAc, 0.8)

//Plane B:
m4_define(zB, 0)
m4_define(rB, rOut)
m4_define(rB1st, rIn)
m4_define(rB2nd, calc(0.5*(rB1st+rB)))
m4_define(rRelB, 0.724)
m4_define(rRelBc, 0.8)

//Plane C:
m4_define(zC, 23.8618797)
m4_define(rC, rOut)
m4_define(rC1st, 32)
m4_define(rC2nd, calc(0.5*(rC1st+rC)))
m4_define(rRelC, 0.69)
m4_define(rRelCc, 0.8)

//Plane D:
m4_define(zD, 47.7237594)
m4_define(rD, rOut)
m4_define(rD1st, 38.4)
m4_define(rD2nd, calc(0.5*(rD1st+rD)))
m4_define(rRelD, 0.65)
m4_define(rRelDc, 0.8)

//Plane E:
m4_define(zE, 59.65)
m4_define(rE, rOut)
m4_define(rE1st, 40)
m4_define(rE2nd, calc(0.5*(rE1st+rE)))
m4_define(rRelE, 0.65)
m4_define(rRelEc, 0.8)

//Plane F:
m4_define(zF, 153.765215)
m4_define(rF, rOut)
m4_define(rF1st, 40)
m4_define(rF2nd, calc(0.5*(rF1st+rF)))
m4_define(rRelF, 0.65)
m4_define(rRelFc, 0.8)

//Plane G:
m4_define(zG, 194.098295)
m4_define(rG, rOut)
m4_define(rG1st, 40)
m4_define(rG2nd, calc(0.5*(rG1st+rG)))
m4_define(rRelG, 0.65)
m4_define(rRelGc, 0.8)

//Plane H:
m4_define(zH, 507.8)
m4_define(rH, rOut)
m4_define(rH1st, 40)
m4_define(rH2nd, calc(0.5*(rH1st+rH)))
m4_define(rRelH, 0.65)
m4_define(rRelHc, 0.8)

convertToMeters 0.001;

vertices
(
//Plane A:
(calc(rRelA*rA*cos(pi/4)) -calc(rRelA*rA*sin(pi/4)) zA) vlabel(A0)
(calc(rRelA*rA*cos(pi/4)) calc(rRelA*rA*sin(pi/4)) zA) vlabel(A1)
(calc(-rRelA*rA*cos(pi/4)) calc(rRelA*rA*sin(pi/4)) zA) vlabel(A2)
(calc(-rRelA*rA*cos(pi/4)) -calc(rRelA*rA*sin(pi/4)) zA) vlabel(A3)
(calc(rA*cos(pi/4)) -calc(rA*sin(pi/4)) zA) vlabel(A4)
(calc(rA*cos(pi/4)) calc(rA*sin(pi/4)) zA) vlabel(A5)
(calc(-rA*cos(pi/4)) calc(rA*sin(pi/4)) zA) vlabel(A6)
(calc(-rA*cos(pi/4)) -calc(rA*sin(pi/4)) zA) vlabel(A7)

//Plane B:
(calc(rRelB*rB1st*cos(pi/4)) -calc(rRelB*rB1st*sin(pi/4)) zB) vlabel(B0)
(calc(rRelB*rB1st*cos(pi/4)) calc(rRelB*rB1st*sin(pi/4)) zB) vlabel(B1)
(calc(-rRelB*rB1st*cos(pi/4)) calc(rRelB*rB1st*sin(pi/4)) zB) vlabel(B2)
(calc(-rRelB*rB1st*cos(pi/4)) -calc(rRelB*rB1st*sin(pi/4)) zB) vlabel(B3)
(calc(rB1st*cos(pi/4)) -calc(rB1st*sin(pi/4)) zB) vlabel(B4)
(calc(rB1st*cos(pi/4)) calc(rB1st*sin(pi/4)) zB) vlabel(B5)
(calc(-rB1st*cos(pi/4)) calc(rB1st*sin(pi/4)) zB) vlabel(B6)
(calc(-rB1st*cos(pi/4)) -calc(rB1st*sin(pi/4)) zB) vlabel(B7)
(calc(rB2nd*cos(pi/4)) -calc(rB2nd*sin(pi/4)) zB) vlabel(B8)
(calc(rB2nd*cos(pi/4)) calc(rB2nd*sin(pi/4)) zB) vlabel(B9)
(calc(-rB2nd*cos(pi/4)) calc(rB2nd*sin(pi/4)) zB) vlabel(B10)
(calc(-rB2nd*cos(pi/4)) -calc(rB2nd*sin(pi/4)) zB) vlabel(B11)
(calc(rB*cos(pi/4)) -calc(rB*sin(pi/4)) zB) vlabel(B12)
(calc(rB*cos(pi/4)) calc(rB*sin(pi/4)) zB) vlabel(B13)
(calc(-rB*cos(pi/4)) calc(rB*sin(pi/4)) zB) vlabel(B14)
(calc(-rB*cos(pi/4)) -calc(rB*sin(pi/4)) zB) vlabel(B15)

//Plane C:
(calc(rRelC*rC1st*cos(pi/4)) -calc(rRelC*rC1st*sin(pi/4)) zC) vlabel(C0)
(calc(rRelC*rC1st*cos(pi/4)) calc(rRelC*rC1st*sin(pi/4)) zC) vlabel(C1)
(calc(-rRelC*rC1st*cos(pi/4)) calc(rRelC*rC1st*sin(pi/4)) zC) vlabel(C2)
(calc(-rRelC*rC1st*cos(pi/4)) -calc(rRelC*rC1st*sin(pi/4)) zC) vlabel(C3)
(calc(rC1st*cos(pi/4)) -calc(rC1st*sin(pi/4)) zC) vlabel(C4)
(calc(rC1st*cos(pi/4)) calc(rC1st*sin(pi/4)) zC) vlabel(C5)
(calc(-rC1st*cos(pi/4)) calc(rC1st*sin(pi/4)) zC) vlabel(C6)
(calc(-rC1st*cos(pi/4)) -calc(rC1st*sin(pi/4)) zC) vlabel(C7)
(calc(rC2nd*cos(pi/4)) -calc(rC2nd*sin(pi/4)) zC) vlabel(C8)
(calc(rC2nd*cos(pi/4)) calc(rC2nd*sin(pi/4)) zC) vlabel(C9)
(calc(-rC2nd*cos(pi/4)) calc(rC2nd*sin(pi/4)) zC) vlabel(C10)
(calc(-rC2nd*cos(pi/4)) -calc(rC2nd*sin(pi/4)) zC) vlabel(C11)
(calc(rC*cos(pi/4)) -calc(rC*sin(pi/4)) zC) vlabel(C12)
(calc(rC*cos(pi/4)) calc(rC*sin(pi/4)) zC) vlabel(C13)
(calc(-rC*cos(pi/4)) calc(rC*sin(pi/4)) zC) vlabel(C14)
(calc(-rC*cos(pi/4)) -calc(rC*sin(pi/4)) zC) vlabel(C15)

//Plane D:
(calc(rRelD*rD1st*cos(pi/4)) -calc(rRelD*rD1st*sin(pi/4)) zD) vlabel(D0)
(calc(rRelD*rD1st*cos(pi/4)) calc(rRelD*rD1st*sin(pi/4)) zD) vlabel(D1)
(calc(-rRelD*rD1st*cos(pi/4)) calc(rRelD*rD1st*sin(pi/4)) zD) vlabel(D2)
(calc(-rRelD*rD1st*cos(pi/4)) -calc(rRelD*rD1st*sin(pi/4)) zD) vlabel(D3)
(calc(rD1st*cos(pi/4)) -calc(rD1st*sin(pi/4)) zD) vlabel(D4)
(calc(rD1st*cos(pi/4)) calc(rD1st*sin(pi/4)) zD) vlabel(D5)
(calc(-rD1st*cos(pi/4)) calc(rD1st*sin(pi/4)) zD) vlabel(D6)
(calc(-rD1st*cos(pi/4)) -calc(rD1st*sin(pi/4)) zD) vlabel(D7)
(calc(rD2nd*cos(pi/4)) -calc(rD2nd*sin(pi/4)) zD) vlabel(D8)
(calc(rD2nd*cos(pi/4)) calc(rD2nd*sin(pi/4)) zD) vlabel(D9)
(calc(-rD2nd*cos(pi/4)) calc(rD2nd*sin(pi/4)) zD) vlabel(D10)
(calc(-rD2nd*cos(pi/4)) -calc(rD2nd*sin(pi/4)) zD) vlabel(D11)
(calc(rD*cos(pi/4)) -calc(rD*sin(pi/4)) zD) vlabel(D12)
(calc(rD*cos(pi/4)) calc(rD*sin(pi/4)) zD) vlabel(D13)
(calc(-rD*cos(pi/4)) calc(rD*sin(pi/4)) zD) vlabel(D14)
(calc(-rD*cos(pi/4)) -calc(rD*sin(pi/4)) zD) vlabel(D15)

//Plane E:
(calc(rRelE*rE1st*cos(pi/4)) -calc(rRelE*rE1st*sin(pi/4)) zE) vlabel(E0)
(calc(rRelE*rE1st*cos(pi/4)) calc(rRelE*rE1st*sin(pi/4)) zE) vlabel(E1)
(calc(-rRelE*rE1st*cos(pi/4)) calc(rRelE*rE1st*sin(pi/4)) zE) vlabel(E2)
(calc(-rRelE*rE1st*cos(pi/4)) -calc(rRelE*rE1st*sin(pi/4)) zE) vlabel(E3)
(calc(rE1st*cos(pi/4)) -calc(rE1st*sin(pi/4)) zE) vlabel(E4)
(calc(rE1st*cos(pi/4)) calc(rE1st*sin(pi/4)) zE) vlabel(E5)
(calc(-rE1st*cos(pi/4)) calc(rE1st*sin(pi/4)) zE) vlabel(E6)
(calc(-rE1st*cos(pi/4)) -calc(rE1st*sin(pi/4)) zE) vlabel(E7)
(calc(rE2nd*cos(pi/4)) -calc(rE2nd*sin(pi/4)) zE) vlabel(E8)
(calc(rE2nd*cos(pi/4)) calc(rE2nd*sin(pi/4)) zE) vlabel(E9)
(calc(-rE2nd*cos(pi/4)) calc(rE2nd*sin(pi/4)) zE) vlabel(E10)
(calc(-rE2nd*cos(pi/4)) -calc(rE2nd*sin(pi/4)) zE) vlabel(E11)
(calc(rE*cos(pi/4)) -calc(rE*sin(pi/4)) zE) vlabel(E12)
(calc(rE*cos(pi/4)) calc(rE*sin(pi/4)) zE) vlabel(E13)
(calc(-rE*cos(pi/4)) calc(rE*sin(pi/4)) zE) vlabel(E14)
(calc(-rE*cos(pi/4)) -calc(rE*sin(pi/4)) zE) vlabel(E15)

//Plane F:
(calc(rRelF*rF1st*cos(pi/4)) -calc(rRelF*rF1st*sin(pi/4)) zF) vlabel(F0)
(calc(rRelF*rF1st*cos(pi/4)) calc(rRelF*rF1st*sin(pi/4)) zF) vlabel(F1)
(calc(-rRelF*rF1st*cos(pi/4)) calc(rRelF*rF1st*sin(pi/4)) zF) vlabel(F2)
(calc(-rRelF*rF1st*cos(pi/4)) -calc(rRelF*rF1st*sin(pi/4)) zF) vlabel(F3)
(calc(rF1st*cos(pi/4)) -calc(rF1st*sin(pi/4)) zF) vlabel(F4)
(calc(rF1st*cos(pi/4)) calc(rF1st*sin(pi/4)) zF) vlabel(F5)
(calc(-rF1st*cos(pi/4)) calc(rF1st*sin(pi/4)) zF) vlabel(F6)
(calc(-rF1st*cos(pi/4)) -calc(rF1st*sin(pi/4)) zF) vlabel(F7)
(calc(rF2nd*cos(pi/4)) -calc(rF2nd*sin(pi/4)) zF) vlabel(F8)
(calc(rF2nd*cos(pi/4)) calc(rF2nd*sin(pi/4)) zF) vlabel(F9)
(calc(-rF2nd*cos(pi/4)) calc(rF2nd*sin(pi/4)) zF) vlabel(F10)
(calc(-rF2nd*cos(pi/4)) -calc(rF2nd*sin(pi/4)) zF) vlabel(F11)
(calc(rF*cos(pi/4)) -calc(rF*sin(pi/4)) zF) vlabel(F12)
(calc(rF*cos(pi/4)) calc(rF*sin(pi/4)) zF) vlabel(F13)
(calc(-rF*cos(pi/4)) calc(rF*sin(pi/4)) zF) vlabel(F14)
(calc(-rF*cos(pi/4)) -calc(rF*sin(pi/4)) zF) vlabel(F15)

//Plane G:
(calc(rRelG*rG1st*cos(pi/4)) -calc(rRelG*rG1st*sin(pi/4)) zG) vlabel(G0)
(calc(rRelG*rG1st*cos(pi/4)) calc(rRelG*rG1st*sin(pi/4)) zG) vlabel(G1)
(calc(-rRelG*rG1st*cos(pi/4)) calc(rRelG*rG1st*sin(pi/4)) zG) vlabel(G2)
(calc(-rRelG*rG1st*cos(pi/4)) -calc(rRelG*rG1st*sin(pi/4)) zG) vlabel(G3)
(calc(rG1st*cos(pi/4)) -calc(rG1st*sin(pi/4)) zG) vlabel(G4)
(calc(rG1st*cos(pi/4)) calc(rG1st*sin(pi/4)) zG) vlabel(G5)
(calc(-rG1st*cos(pi/4)) calc(rG1st*sin(pi/4)) zG) vlabel(G6)
(calc(-rG1st*cos(pi/4)) -calc(rG1st*sin(pi/4)) zG) vlabel(G7)
(calc(rG2nd*cos(pi/4)) -calc(rG2nd*sin(pi/4)) zG) vlabel(G8)
(calc(rG2nd*cos(pi/4)) calc(rG2nd*sin(pi/4)) zG) vlabel(G9)
(calc(-rG2nd*cos(pi/4)) calc(rG2nd*sin(pi/4)) zG) vlabel(G10)
(calc(-rG2nd*cos(pi/4)) -calc(rG2nd*sin(pi/4)) zG) vlabel(G11)
(calc(rG*cos(pi/4)) -calc(rG*sin(pi/4)) zG) vlabel(G12)
(calc(rG*cos(pi/4)) calc(rG*sin(pi/4)) zG) vlabel(G13)
(calc(-rG*cos(pi/4)) calc(rG*sin(pi/4)) zG) vlabel(G14)
(calc(-rG*cos(pi/4)) -calc(rG*sin(pi/4)) zG) vlabel(G15)

//Plane H:
(calc(rRelH*rH1st*cos(pi/4)) -calc(rRelH*rH1st*sin(pi/4)) zH) vlabel(H0)
(calc(rRelH*rH1st*cos(pi/4)) calc(rRelH*rH1st*sin(pi/4)) zH) vlabel(H1)
(calc(-rRelH*rH1st*cos(pi/4)) calc(rRelH*rH1st*sin(pi/4)) zH) vlabel(H2)
(calc(-rRelH*rH1st*cos(pi/4)) -calc(rRelH*rH1st*sin(pi/4)) zH) vlabel(H3)
(calc(rH1st*cos(pi/4)) -calc(rH1st*sin(pi/4)) zH) vlabel(H4)
(calc(rH1st*cos(pi/4)) calc(rH1st*sin(pi/4)) zH) vlabel(H5)
(calc(-rH1st*cos(pi/4)) calc(rH1st*sin(pi/4)) zH) vlabel(H6)
(calc(-rH1st*cos(pi/4)) -calc(rH1st*sin(pi/4)) zH) vlabel(H7)
(calc(rH2nd*cos(pi/4)) -calc(rH2nd*sin(pi/4)) zH) vlabel(H8)
(calc(rH2nd*cos(pi/4)) calc(rH2nd*sin(pi/4)) zH) vlabel(H9)
(calc(-rH2nd*cos(pi/4)) calc(rH2nd*sin(pi/4)) zH) vlabel(H10)
(calc(-rH2nd*cos(pi/4)) -calc(rH2nd*sin(pi/4)) zH) vlabel(H11)
(calc(rH*cos(pi/4)) -calc(rH*sin(pi/4)) zH) vlabel(H12)
(calc(rH*cos(pi/4)) calc(rH*sin(pi/4)) zH) vlabel(H13)
(calc(-rH*cos(pi/4)) calc(rH*sin(pi/4)) zH) vlabel(H14)
(calc(-rH*cos(pi/4)) -calc(rH*sin(pi/4)) zH) vlabel(H15)
);

// Defining blocks:
blocks
(
    //Blocks between plane A and plane B:
    // block0 - positive x O-grid block
    hex (A5 A1 A0 A4 B5 B1 B0 B4 ) AB
    (rNumberOfCells1st tNumberOfCells zABnumberOfCells)
    edgeGrading (rGrading1A rGrading1A rGrading1B rGrading1B
                 1          1          1          1
                 zGradingAB zGradingAB zGradingAB zGradingAB)
    // block1 - positive y O-grid block
    hex (A6 A2 A1 A5 B6 B2 B1 B5 ) AB
    (rNumberOfCells1st tNumberOfCells zABnumberOfCells)
    edgeGrading (rGrading1A rGrading1A rGrading1B rGrading1B
                 1          1          1          1
                 zGradingAB zGradingAB zGradingAB zGradingAB)
    // block2 - negative x O-grid block
    hex (A7 A3 A2 A6 B7 B3 B2 B6 ) AB
    (rNumberOfCells1st tNumberOfCells zABnumberOfCells)
    edgeGrading (rGrading1A rGrading1A rGrading1B rGrading1B
                 1          1          1          1
                 zGradingAB zGradingAB zGradingAB zGradingAB)
    // block3 - negative y O-grid block
    hex (A4 A0 A3 A7 B4 B0 B3 B7 ) AB
    (rNumberOfCells1st tNumberOfCells zABnumberOfCells)
    edgeGrading (rGrading1A rGrading1A rGrading1B rGrading1B
                 1          1          1          1
                 zGradingAB zGradingAB zGradingAB zGradingAB)
    // block4 - central O-grid block
    hex (A0 A1 A2 A3 B0 B1 B2 B3 ) AB
    (tNumberOfCells tNumberOfCells zABnumberOfCells)
    edgeGrading (1          1          1          1
                 1          1          1          1
                 zGradingAB zGradingAB zGradingAB zGradingAB)

    //Blocks between plane B and plane C:
    // block0 - positive x O-grid block 1st belt
    hex (B5 B1 B0 B4 C5 C1 C0 C4 ) BC
    (rNumberOfCells1st tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading1B rGrading1B rGrading1C rGrading1C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block1 - positive y O-grid block 1st belt
    hex (B6 B2 B1 B5 C6 C2 C1 C5 ) BC
    (rNumberOfCells1st tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading1B rGrading1B rGrading1C rGrading1C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block2 - negative x O-grid block 1st belt
    hex (B7 B3 B2 B6 C7 C3 C2 C6 ) BC
    (rNumberOfCells1st tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading1B rGrading1B rGrading1C rGrading1C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block3 - negative y O-grid block 1st belt
    hex (B4 B0 B3 B7 C4 C0 C3 C7 ) BC
    (rNumberOfCells1st tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading1B rGrading1B rGrading1C rGrading1C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block4 - central O-grid block 
    hex (B0 B1 B2 B3 C0 C1 C2 C3 ) BC
    (tNumberOfCells tNumberOfCells zBCnumberOfCells)
    edgeGrading (1          1          1          1
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block5 - positive x O-grid block 2nd belt 
    hex (B9 B5 B4 B8 C9 C5 C4 C8 ) BC
    (rNumberOfCells2nd tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading2B rGrading2B rGrading2C rGrading2C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block6 - positive y O-grid block 2nd belt
    hex (B10 B6 B5 B9 C10 C6 C5 C9 ) BC
    (rNumberOfCells2nd tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading2B rGrading2B rGrading2C rGrading2C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block7 - negative x O-grid block 2nd belt
    hex (B11 B7 B6 B10 C11 C7 C6 C10 ) BC
    (rNumberOfCells2nd tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading2B rGrading2B rGrading2C rGrading2C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block8 - negative y O-grid block 2nd belt
    hex (B8 B4 B7 B11 C8 C4 C7 C11 ) BC
    (rNumberOfCells2nd tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading2B rGrading2B rGrading2C rGrading2C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block9 - positive x O-grid block 3rd belt
    hex (B13 B9 B8 B12 C13 C9 C8 C12 ) BC
    (rNumberOfCells3rd tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading3B rGrading3B rGrading3C rGrading3C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block10 - positive y O-grid block 3rd belt
    hex (B14 B10 B9 B13 C14 C10 C9 C13 ) BC
    (rNumberOfCells3rd tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading3B rGrading3B rGrading3C rGrading3C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block11 - negative x O-grid block 3rd belt
    hex (B15 B11 B10 B14 C15 C11 C10 C14 ) BC
    (rNumberOfCells3rd tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading3B rGrading3B rGrading3C rGrading3C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)
    // block12 - negative y O-grid block 3rd belt
    hex (B12 B8 B11 B15 C12 C8 C11 C15 ) BC
    (rNumberOfCells3rd tNumberOfCells zBCnumberOfCells)
    edgeGrading (rGrading3B rGrading3B rGrading3C rGrading3C
                 1          1          1          1
                 zGradingBC zGradingBC zGradingBC zGradingBC)

    //Blocks between plane C and plane D:
    // block0 - positive x O-grid block 1st belt
    hex (C5 C1 C0 C4 D5 D1 D0 D4 ) CD
    (rNumberOfCells1st tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading1C rGrading1C rGrading1D rGrading1D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block1 - positive y O-grid block 1st belt
    hex (C6 C2 C1 C5 D6 D2 D1 D5 ) CD
    (rNumberOfCells1st tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading1C rGrading1C rGrading1D rGrading1D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block2 - negative x O-grid block 1st belt
    hex (C7 C3 C2 C6 D7 D3 D2 D6 ) CD
    (rNumberOfCells1st tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading1C rGrading1C rGrading1D rGrading1D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block3 - negative y O-grid block 1st belt
    hex (C4 C0 C3 C7 D4 D0 D3 D7 ) CD
    (rNumberOfCells1st tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading1C rGrading1C rGrading1D rGrading1D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block4 - central O-grid block 
    hex (C0 C1 C2 C3 D0 D1 D2 D3 ) CD
    (tNumberOfCells tNumberOfCells zCDnumberOfCells)
    edgeGrading (1          1          1          1
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block5 - positive x O-grid block 2nd belt 
    hex (C9 C5 C4 C8 D9 D5 D4 D8 ) CD
    (rNumberOfCells2nd tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading2C rGrading2C rGrading2D rGrading2D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block6 - positive y O-grid block 2nd belt
    hex (C10 C6 C5 C9 D10 D6 D5 D9 ) CD
    (rNumberOfCells2nd tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading2C rGrading2C rGrading2D rGrading2D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block7 - negative x O-grid block 2nd belt
    hex (C11 C7 C6 C10 D11 D7 D6 D10 ) CD
    (rNumberOfCells2nd tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading2C rGrading2C rGrading2D rGrading2D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block8 - negative y O-grid block 2nd belt
    hex (C8 C4 C7 C11 D8 D4 D7 D11 ) CD
    (rNumberOfCells2nd tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading2C rGrading2C rGrading2D rGrading2D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block9 - positive x O-grid block 3rd belt
    hex (C13 C9 C8 C12 D13 D9 D8 D12 ) CD
    (rNumberOfCells3rd tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading3C rGrading3C rGrading3D rGrading3D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block10 - positive y O-grid block 3rd belt
    hex (C14 C10 C9 C13 D14 D10 D9 D13 ) CD
    (rNumberOfCells3rd tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading3C rGrading3C rGrading3D rGrading3D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block11 - negative x O-grid block 3rd belt
    hex (C15 C11 C10 C14 D15 D11 D10 D14 ) CD
    (rNumberOfCells3rd tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading3C rGrading3C rGrading3D rGrading3D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)
    // block12 - negative y O-grid block 3rd belt
    hex (C12 C8 C11 C15 D12 D8 D11 D15 ) CD
    (rNumberOfCells3rd tNumberOfCells zCDnumberOfCells)
    edgeGrading (rGrading3C rGrading3C rGrading3D rGrading3D
                 1          1          1          1
                 zGradingCD zGradingCD zGradingCD zGradingCD)

    //Blocks between plane D and plane E:
    // block0 - positive x O-grid block 1st belt
    hex (D5 D1 D0 D4 E5 E1 E0 E4 ) DE
    (rNumberOfCells1st tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading1D rGrading1D rGrading1E rGrading1E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block1 - positive y O-grid block 1st belt
    hex (D6 D2 D1 D5 E6 E2 E1 E5 ) DE
    (rNumberOfCells1st tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading1D rGrading1D rGrading1E rGrading1E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block2 - negative x O-grid block 1st belt
    hex (D7 D3 D2 D6 E7 E3 E2 E6 ) DE
    (rNumberOfCells1st tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading1D rGrading1D rGrading1E rGrading1E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block3 - negative y O-grid block 1st belt
    hex (D4 D0 D3 D7 E4 E0 E3 E7 ) DE
    (rNumberOfCells1st tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading1D rGrading1D rGrading1E rGrading1E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block4 - central O-grid block 
    hex (D0 D1 D2 D3 E0 E1 E2 E3 ) DE
    (tNumberOfCells tNumberOfCells zDEnumberOfCells)
    edgeGrading (1          1          1          1
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block5 - positive x O-grid block 2nd belt 
    hex (D9 D5 D4 D8 E9 E5 E4 E8 ) DE
    (rNumberOfCells2nd tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading2D rGrading2D rGrading2E rGrading2E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block6 - positive y O-grid block 2nd belt
    hex (D10 D6 D5 D9 E10 E6 E5 E9 ) DE
    (rNumberOfCells2nd tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading2D rGrading2D rGrading2E rGrading2E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block7 - negative x O-grid block 2nd belt
    hex (D11 D7 D6 D10 E11 E7 E6 E10 ) DE
    (rNumberOfCells2nd tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading2D rGrading2D rGrading2E rGrading2E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block8 - negative y O-grid block 2nd belt
    hex (D8 D4 D7 D11 E8 E4 E7 E11 ) DE
    (rNumberOfCells2nd tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading2D rGrading2D rGrading2E rGrading2E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block9 - positive x O-grid block 3rd belt
    hex (D13 D9 D8 D12 E13 E9 E8 E12 ) DE
    (rNumberOfCells3rd tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading3D rGrading3D rGrading3E rGrading3E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block10 - positive y O-grid block 3rd belt
    hex (D14 D10 D9 D13 E14 E10 E9 E13 ) DE
    (rNumberOfCells3rd tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading3D rGrading3D rGrading3E rGrading3E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block11 - negative x O-grid block 3rd belt
    hex (D15 D11 D10 D14 E15 E11 E10 E14 ) DE
    (rNumberOfCells3rd tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading3D rGrading3D rGrading3E rGrading3E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)
    // block12 - negative y O-grid block 3rd belt
    hex (D12 D8 D11 D15 E12 E8 E11 E15 ) DE
    (rNumberOfCells3rd tNumberOfCells zDEnumberOfCells)
    edgeGrading (rGrading3D rGrading3D rGrading3E rGrading3E
                 1          1          1          1
                 zGradingDE zGradingDE zGradingDE zGradingDE)

    //Blocks between plane E and plane F:
    // block0 - positive x O-grid block 1st belt
    hex (E5 E1 E0 E4 F5 F1 F0 F4 ) EF
    (rNumberOfCells1st tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading1E rGrading1E rGrading1F rGrading1F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block1 - positive y O-grid block 1st belt
    hex (E6 E2 E1 E5 F6 F2 F1 F5 ) EF
    (rNumberOfCells1st tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading1E rGrading1E rGrading1F rGrading1F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block2 - negative x O-grid block 1st belt
    hex (E7 E3 E2 E6 F7 F3 F2 F6 ) EF
    (rNumberOfCells1st tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading1E rGrading1E rGrading1F rGrading1F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block3 - negative y O-grid block 1st belt
    hex (E4 E0 E3 E7 F4 F0 F3 F7 ) EF
    (rNumberOfCells1st tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading1E rGrading1E rGrading1F rGrading1F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block4 - central O-grid block 
    hex (E0 E1 E2 E3 F0 F1 F2 F3 ) EF
    (tNumberOfCells tNumberOfCells zEFnumberOfCells)
    edgeGrading (1          1          1          1
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block5 - positive x O-grid block 2nd belt 
    hex (E9 E5 E4 E8 F9 F5 F4 F8 ) EF
    (rNumberOfCells2nd tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading2E rGrading2E rGrading2F rGrading2F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block6 - positive y O-grid block 2nd belt
    hex (E10 E6 E5 E9 F10 F6 F5 F9 ) EF
    (rNumberOfCells2nd tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading2E rGrading2E rGrading2F rGrading2F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block7 - negative x O-grid block 2nd belt
    hex (E11 E7 E6 E10 F11 F7 F6 F10 ) EF
    (rNumberOfCells2nd tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading2E rGrading2E rGrading2F rGrading2F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block8 - negative y O-grid block 2nd belt
    hex (E8 E4 E7 E11 F8 F4 F7 F11 ) EF
    (rNumberOfCells2nd tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading2E rGrading2E rGrading2F rGrading2F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block9 - positive x O-grid block 3rd belt
    hex (E13 E9 E8 E12 F13 F9 F8 F12 ) EF
    (rNumberOfCells3rd tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading3E rGrading3E rGrading3F rGrading3F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block10 - positive y O-grid block 3rd belt
    hex (E14 E10 E9 E13 F14 F10 F9 F13 ) EF
    (rNumberOfCells3rd tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading3E rGrading3E rGrading3F rGrading3F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block11 - negative x O-grid block 3rd belt
    hex (E15 E11 E10 E14 F15 F11 F10 F14 ) EF
    (rNumberOfCells3rd tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading3E rGrading3E rGrading3F rGrading3F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)
    // block12 - negative y O-grid block 3rd belt
    hex (E12 E8 E11 E15 F12 F8 F11 F15 ) EF
    (rNumberOfCells3rd tNumberOfCells zEFnumberOfCells)
    edgeGrading (rGrading3E rGrading3E rGrading3F rGrading3F
                 1          1          1          1
                 zGradingEF zGradingEF zGradingEF zGradingEF)

    //Blocks between plane F and plane G:
    // block0 - positive x O-grid block 1st belt
    hex (F5 F1 F0 F4 G5 G1 G0 G4 ) FG
    (rNumberOfCells1st tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading1F rGrading1F rGrading1G rGrading1G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block1 - positive y O-grid block 1st belt
    hex (F6 F2 F1 F5 G6 G2 G1 G5 ) FG
    (rNumberOfCells1st tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading1F rGrading1F rGrading1G rGrading1G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block2 - negative x O-grid block 1st belt
    hex (F7 F3 F2 F6 G7 G3 G2 G6 ) FG
    (rNumberOfCells1st tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading1F rGrading1F rGrading1G rGrading1G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block3 - negative y O-grid block 1st belt
    hex (F4 F0 F3 F7 G4 G0 G3 G7 ) FG
    (rNumberOfCells1st tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading1F rGrading1F rGrading1G rGrading1G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block4 - central O-grid block 
    hex (F0 F1 F2 F3 G0 G1 G2 G3 ) FG
    (tNumberOfCells tNumberOfCells zFGnumberOfCells)
    edgeGrading (1          1          1          1
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block5 - positive x O-grid block 2nd belt 
    hex (F9 F5 F4 F8 G9 G5 G4 G8 ) FG
    (rNumberOfCells2nd tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading2F rGrading2F rGrading2G rGrading2G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block6 - positive y O-grid block 2nd belt
    hex (F10 F6 F5 F9 G10 G6 G5 G9 ) FG
    (rNumberOfCells2nd tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading2F rGrading2F rGrading2G rGrading2G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block7 - negative x O-grid block 2nd belt
    hex (F11 F7 F6 F10 G11 G7 G6 G10 ) FG
    (rNumberOfCells2nd tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading2F rGrading2F rGrading2G rGrading2G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block8 - negative y O-grid block 2nd belt
    hex (F8 F4 F7 F11 G8 G4 G7 G11 ) FG
    (rNumberOfCells2nd tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading2F rGrading2F rGrading2G rGrading2G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block9 - positive x O-grid block 3rd belt
    hex (F13 F9 F8 F12 G13 G9 G8 G12 ) FG
    (rNumberOfCells3rd tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading3F rGrading3F rGrading3G rGrading3G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block10 - positive y O-grid block 3rd belt
    hex (F14 F10 F9 F13 G14 G10 G9 G13 ) FG
    (rNumberOfCells3rd tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading3F rGrading3F rGrading3G rGrading3G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block11 - negative x O-grid block 3rd belt
    hex (F15 F11 F10 F14 G15 G11 G10 G14 ) FG
    (rNumberOfCells3rd tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading3F rGrading3F rGrading3G rGrading3G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)
    // block12 - negative y O-grid block 3rd belt
    hex (F12 F8 F11 F15 G12 G8 G11 G15 ) FG
    (rNumberOfCells3rd tNumberOfCells zFGnumberOfCells)
    edgeGrading (rGrading3F rGrading3F rGrading3G rGrading3G
                 1          1          1          1
                 zGradingFG zGradingFG zGradingFG zGradingFG)

    //Blocks between plane G and plane H:
    // block0 - positive x O-grid block 1st belt
    hex (G5 G1 G0 G4 H5 H1 H0 H4 ) GH
    (rNumberOfCells1st tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading1G rGrading1G rGrading1H rGrading1H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block1 - positive y O-grid block 1st belt
    hex (G6 G2 G1 G5 H6 H2 H1 H5 ) GH
    (rNumberOfCells1st tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading1G rGrading1G rGrading1H rGrading1H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block2 - negative x O-grid block 1st belt
    hex (G7 G3 G2 G6 H7 H3 H2 H6 ) GH
    (rNumberOfCells1st tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading1G rGrading1G rGrading1H rGrading1H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block3 - negative y O-grid block 1st belt
    hex (G4 G0 G3 G7 H4 H0 H3 H7 ) GH
    (rNumberOfCells1st tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading1G rGrading1G rGrading1H rGrading1H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block4 - central O-grid block 
    hex (G0 G1 G2 G3 H0 H1 H2 H3 ) GH
    (tNumberOfCells tNumberOfCells zGHnumberOfCells)
    edgeGrading (1          1          1          1
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block5 - positive x O-grid block 2nd belt 
    hex (G9 G5 G4 G8 H9 H5 H4 H8 ) GH
    (rNumberOfCells2nd tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading2G rGrading2G rGrading2H rGrading2H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block6 - positive y O-grid block 2nd belt
    hex (G10 G6 G5 G9 H10 H6 H5 H9 ) GH
    (rNumberOfCells2nd tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading2G rGrading2G rGrading2H rGrading2H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block7 - negative x O-grid block 2nd belt
    hex (G11 G7 G6 G10 H11 H7 H6 H10 ) GH
    (rNumberOfCells2nd tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading2G rGrading2G rGrading2H rGrading2H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block8 - negative y O-grid block 2nd belt
    hex (G8 G4 G7 G11 H8 H4 H7 H11 ) GH
    (rNumberOfCells2nd tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading2G rGrading2G rGrading2H rGrading2H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block9 - positive x O-grid block 3rd belt
    hex (G13 G9 G8 G12 H13 H9 H8 H12 ) GH
    (rNumberOfCells3rd tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading3G rGrading3G rGrading3H rGrading3H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block10 - positive y O-grid block 3rd belt
    hex (G14 G10 G9 G13 H14 H10 H9 H13 ) GH
    (rNumberOfCells3rd tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading3G rGrading3G rGrading3H rGrading3H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block11 - negative x O-grid block 3rd belt
    hex (G15 G11 G10 G14 H15 H11 H10 H14 ) GH
    (rNumberOfCells3rd tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading3G rGrading3G rGrading3H rGrading3H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
    // block12 - negative y O-grid block 3rd belt
    hex (G12 G8 G11 G15 H12 H8 H11 H15 ) GH
    (rNumberOfCells3rd tNumberOfCells zGHnumberOfCells)
    edgeGrading (rGrading3G rGrading3G rGrading3H rGrading3H
                 1          1          1          1
                 zGradingGH zGradingGH zGradingGH zGradingGH)
);

edges
(
    //Plane A:
    arc A0 A1 (calc(rRelAc*rRelA*rA) 0 zA)
    arc A1 A2 (0 calc(rRelAc*rRelA*rA) zA)
    arc A2 A3 (-calc(rRelAc*rRelA*rA) 0 zA)
    arc A3 A0 (0 -calc(rRelAc*rRelA*rA) zA)
    arc A4 A5 (rA 0 zA)
    arc A5 A6 (0 rA zA)
    arc A6 A7 (-rA 0 zA)
    arc A7 A4 (0 -rA zA)

    //Plane B:
    arc B0  B1  (calc(rRelBc*rRelB*rB1st) 0 zB)
    arc B1  B2  (0 calc(rRelBc*rRelB*rB1st) zB)
    arc B2  B3  (-calc(rRelBc*rRelB*rB1st) 0 zB)
    arc B3  B0  (0 -calc(rRelBc*rRelB*rB1st) zB)
    arc B4  B5  (rB1st 0 zB)
    arc B5  B6  (0 rB1st zB)
    arc B6  B7  (-rB1st 0 zB)
    arc B7  B4  (0 -rB1st zB)
    arc B8  B9  (rB2nd 0 zB)
    arc B9  B10 (0 rB2nd zB)
    arc B10 B11 (-rB2nd 0 zB)
    arc B11 B8  (0 -rB2nd zB)
    arc B12 B13 (rB 0 zB)
    arc B13 B14 (0 rB zB)
    arc B14 B15 (-rB 0 zB)
    arc B15 B12 (0 -rB zB)

    //Plane C:
    arc C0  C1 (calc(rRelCc*rRelC*rC1st) 0 zC)
    arc C1  C2 (0 calc(rRelCc*rRelC*rC1st) zC)
    arc C2  C3 (-calc(rRelCc*rRelC*rC1st) 0 zC)
    arc C3  C0 (0 -calc(rRelCc*rRelC*rC1st) zC)
    arc C4  C5 (rC1st 0 zC)
    arc C5  C6 (0 rC1st zC)
    arc C6  C7 (-rC1st 0 zC)
    arc C7  C4 (0 -rC1st zC)
    arc C8  C9  (rC2nd 0 zC)
    arc C9  C10 (0 rC2nd zC)
    arc C10 C11 (-rC2nd 0 zC)
    arc C11 C8  (0 -rC2nd zC)
    arc C12 C13 (rC 0 zC)
    arc C13 C14 (0 rC zC)
    arc C14 C15 (-rC 0 zC)
    arc C15 C12 (0 -rC zC)

    //Plane D:
    arc D0  D1 (calc(rRelDc*rRelD*rD1st) 0 zD)
    arc D1  D2 (0 calc(rRelDc*rRelD*rD1st) zD)
    arc D2  D3 (-calc(rRelDc*rRelD*rD1st) 0 zD)
    arc D3  D0 (0 -calc(rRelDc*rRelD*rD1st) zD)
    arc D4  D5 (rD1st 0 zD)
    arc D5  D6 (0 rD1st zD)
    arc D6  D7 (-rD1st 0 zD)
    arc D7  D4 (0 -rD1st zD)
    arc D8  D9  (rD2nd 0 zD)
    arc D9  D10 (0 rD2nd zD)
    arc D10 D11 (-rD2nd 0 zD)
    arc D11 D8  (0 -rD2nd zD)
    arc D12 D13 (rD 0 zD)
    arc D13 D14 (0 rD zD)
    arc D14 D15 (-rD 0 zD)
    arc D15 D12 (0 -rD zD)

    //Plane E:
    arc E0  E1 (calc(rRelEc*rRelE*rE1st) 0 zE)
    arc E1  E2 (0 calc(rRelEc*rRelE*rE1st) zE)
    arc E2  E3 (-calc(rRelEc*rRelE*rE1st) 0 zE)
    arc E3  E0 (0 -calc(rRelEc*rRelE*rE1st) zE)
    arc E4  E5 (rE1st 0 zE)
    arc E5  E6 (0 rE1st zE)
    arc E6  E7 (-rE1st 0 zE)
    arc E7  E4 (0 -rE1st zE)
    arc E8  E9  (rE2nd 0 zE)
    arc E9  E10 (0 rE2nd zE)
    arc E10 E11 (-rE2nd 0 zE)
    arc E11 E8  (0 -rE2nd zE)
    arc E12 E13 (rE 0 zE)
    arc E13 E14 (0 rE zE)
    arc E14 E15 (-rE 0 zE)
    arc E15 E12 (0 -rE zE)

    //Plane F:
    arc F0  F1 (calc(rRelFc*rRelF*rF1st) 0 zF)
    arc F1  F2 (0 calc(rRelFc*rRelF*rF1st) zF)
    arc F2  F3 (-calc(rRelFc*rRelF*rF1st) 0 zF)
    arc F3  F0 (0 -calc(rRelFc*rRelF*rF1st) zF)
    arc F4  F5 (rF1st 0 zF)
    arc F5  F6 (0 rF1st zF)
    arc F6  F7 (-rF1st 0 zF)
    arc F7  F4 (0 -rF1st zF)
    arc F8  F9  (rF2nd 0 zF)
    arc F9  F10 (0 rF2nd zF)
    arc F10 F11 (-rF2nd 0 zF)
    arc F11 F8  (0 -rF2nd zF)
    arc F12 F13 (rF 0 zF)
    arc F13 F14 (0 rF zF)
    arc F14 F15 (-rF 0 zF)
    arc F15 F12 (0 -rF zF)

    //Plane G:
    arc G0  G1 (calc(rRelGc*rRelG*rG1st) 0 zG)
    arc G1  G2 (0 calc(rRelGc*rRelG*rG1st) zG)
    arc G2  G3 (-calc(rRelGc*rRelG*rG1st) 0 zG)
    arc G3  G0 (0 -calc(rRelGc*rRelG*rG1st) zG)
    arc G4  G5 (rG1st 0 zG)
    arc G5  G6 (0 rG1st zG)
    arc G6  G7 (-rG1st 0 zG)
    arc G7  G4 (0 -rG1st zG)
    arc G8  G9  (rG2nd 0 zG)
    arc G9  G10 (0 rG2nd zG)
    arc G10 G11 (-rG2nd 0 zG)
    arc G11 G8  (0 -rG2nd zG)
    arc G12 G13 (rG 0 zG)
    arc G13 G14 (0 rG zG)
    arc G14 G15 (-rG 0 zG)
    arc G15 G12 (0 -rG zG)

    //Plane H:
    arc H0  H1 (calc(rRelHc*rRelH*rH1st) 0 zH)
    arc H1  H2 (0 calc(rRelHc*rRelH*rH1st) zH)
    arc H2  H3 (-calc(rRelHc*rRelH*rH1st) 0 zH)
    arc H3  H0 (0 -calc(rRelHc*rRelH*rH1st) zH)
    arc H4  H5 (rH1st 0 zH)
    arc H5  H6 (0 rH1st zH)
    arc H6  H7 (-rH1st 0 zH)
    arc H7  H4 (0 -rH1st zH)
    arc H8  H9  (rH2nd 0 zH)
    arc H9  H10 (0 rH2nd zH)
    arc H10 H11 (-rH2nd 0 zH)
    arc H11 H8  (0 -rH2nd zH)
    arc H12 H13 (rH 0 zH)
    arc H13 H14 (0 rH zH)
    arc H14 H15 (-rH 0 zH)
    arc H15 H12 (0 -rH zH)
);

// Defining patches:
patches
(
    patch inlet
    (
       (A1 A5 A4 A0)
       (A2 A6 A5 A1)
       (A3 A7 A6 A2)
       (A0 A4 A7 A3)
       (A3 A2 A1 A0)
    )
    wall walls
    (
       (A4 A5 B5 B4)
       (A5 A6 B6 B5)
       (A6 A7 B7 B6)
       (A7 A4 B4 B7)

       (B5 B9 B8 B4)
       (B6 B10 B9 B5)
       (B7 B11 B10 B6)
       (B4 B8 B11 B7)
       (B9 B13 B12 B8)
       (B10 B14 B13 B9)
       (B11 B15 B14 B10)
       (B8 B12 B15 B11)

       (B12 B13 C13 C12)
       (B13 B14 C14 C13)
       (B14 B15 C15 C14)
       (B15 B12 C12 C15)

       (C12 C13 D13 D12)
       (C13 C14 D14 D13)
       (C14 C15 D15 D14)
       (C15 C12 D12 D15)

       (D12 D13 E13 E12)
       (D13 D14 E14 E13)
       (D14 D15 E15 E14)
       (D15 D12 E12 E15)

       (E12 E13 F13 F12)
       (E13 E14 F14 F13)
       (E14 E15 F15 F14)
       (E15 E12 F12 F15)

       (F12 F13 G13 G12)
       (F13 F14 G14 G13)
       (F14 F15 G15 G14)
       (F15 F12 G12 G15)

       (G12 G13 H13 H12)
       (G13 G14 H14 H13)
       (G14 G15 H15 H14)
       (G15 G12 H12 H15)
    )
    patch outlet
    (
       (H0 H4 H5 H1)
       (H1 H5 H6 H2)
       (H2 H6 H7 H3)
       (H3 H7 H4 H0)
       (H0 H1 H2 H3)

       (H4 H8 H9 H5)
       (H5 H9 H10 H6)
       (H6 H10 H11 H7)
       (H7 H11 H8 H4)

       (H8 H12 H13 H9)
       (H9 H13 H14 H10)
       (H10 H14 H15 H11)
       (H11 H15 H12 H8)
    )
);

mergePatchPairs 
(
);

// ************************************************************************* //
