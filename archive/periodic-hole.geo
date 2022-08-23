//+
Point(1) = {-1, -1, 0, 0.25};
//+
Point(2) = {1, -1, 0, 2.0};
//+
Point(3) = {1, 1, 0, 0.25};
//+
Point(4) = {-1, 1, 0, 2.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 1};

R1 = 0.5;
res = 100;
Point(0) = {0, 0, 0, res};
Point(1000) = { R1, 0, 0, res};
Point(1001) = {-R1, 0, 0, res};
Circle(2000) = {1000,0,1001};
Circle(2001) = {1001,0,1000};
Line Loop(3000) = {2000,2001}; Physical Curve("inner", 4) = {2000,2001};

//+
Curve Loop(1) = {4, 1, 2, 3};
//+
Plane Surface(1) = {1,3000};

Periodic Line {3} = {1} Translate {0, 2, 0};
Periodic Line {2} = {4} Translate {2, 0, 0};
//+
Physical Point("PL") = {1};
//+
Physical Point("PL") += {2};
//+
Physical Point("PL") += {3};
//+
Physical Point("PL") += {4};
//+
Physical Curve("P") = {1};
//+
Physical Curve("P2") = {2};
//+
Physical Curve("P") += {3};
//+
Physical Curve("P2") += {4};
//+
Physical Surface("S") = {1};

Mesh.MshFileVersion = 2.2;
