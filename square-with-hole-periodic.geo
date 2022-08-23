// Command line Parameters
If(!Exists(p))
  p = 5;
EndIf

// Settings
res = 100;
Mesh.CharacteristicLengthMax = 1.0 * 2^(-p);
Mesh.MshFileVersion = 2.0;

R1 = 0.5;

Point(1) = {-1, -1, 0, res};
Point(2) = {1, -1, 0, res} ;
Point(3) = {1, 1, 0, res} ;
Point(4) = {-1, 1, 0, res} ;

Point(0) = {0, 0, 0, res};
Point(1000) = { R1, 0, 0, res};
Point(1001) = {-R1, 0, 0, res};
Circle(2000) = {1000,0,1001};
Circle(2001) = {1001,0,1000};
Line Loop(3000) = {2000,2001}; Physical Curve("inner", 4) = {2000,2001};

Line(1) = {1,2} ;
Line(2) = {3,2} ;
Line(3) = {3,4} ;
Line(4) = {4,1} ;

Periodic Line {1} = {-3};
Periodic Line {2} = {4};

Curve Loop(5) = {4,1,-2,3};
Physical Curve("outer", 5) = {4,1,-2,3};

Plane Surface(6) = {5,3000}; Physical Surface("mesh", 6) = {6};

Mesh.MshFileVersion = 4.1;  // needed for Gridap
