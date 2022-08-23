//+
Point(1) = {-1, -1, 0, 0.25};
//+
Point(2) = {0, -1, 0, 2.0};
//+
Point(3) = {0, -0, 0, 0.25};
//+
Point(4) = {-1, 0, 0, 2.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 1};
//+
Curve Loop(1) = {4, 1, 2, 3};
//+
Plane Surface(1) = {1};

Periodic Line {3} = {1} Translate {0, 1, 0};
// Periodic Line {2} = {4} Translate {1, 0, 0};
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
