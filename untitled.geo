//+
SetFactory("OpenCASCADE");
Circle(1) = {0, 0, 0, 1, 0, 2*Pi};
//+
Circle(2) = {0, 0, 0, 0.5, 0, 2*Pi};
//+
Extrude {0, 0, 17.5} {
  Curve{1}; 
}
//+
Extrude {0, 0, 1.5} {
  Curve{2}; 
}
//+
Rotate {{0, 1, 0}, {0, 0, 0}, Pi/2} {
  Duplicata { Surface{2}; }
}
//+
Rotate {{0, 1, 0}, {0, 0, 0}, -Pi/2} {
  Surface{2}; 
}
//+
Translate {0, 0, 2.5} {
  Surface{3}; 
}
//+
Translate {0, 0, 15} {
  Surface{2}; 
}
//+
BooleanDifference{ Surface{1}; Delete; }{ Surface{2}; Surface{3}; Delete; }
//+
Recursive Delete {
  Surface{3}; 
}
//+
Recursive Delete {
  Surface{6}; 
}
//+
Recursive Delete {
  Surface{5}; 
}
//+
Recursive Delete {
  Surface{2}; 
}
//+
Recursive Delete {
  Surface{7}; 
}
//+
Curve Loop(9) = {23};
//+
Plane Surface(5) = {9};
