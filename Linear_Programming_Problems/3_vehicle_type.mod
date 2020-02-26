set vmod;
set vconfig;
#param A := 3;
#param B := 5;
#set vmod:= {1..A};
#set vconfig:= {1..B};

param r{vmod,vconfig};
param a{vmod,vconfig};
param c;
param M;
param Q;
param N{vmod};

var x{vmod, vconfig} >= 0 integer ; #number of vehicles model i with configuration j
var y >= 0; #additional overtime man-hours to customize vehicles.

maximize z: sum{i in vmod} sum{j in vconfig} (r[i,j]*x[i,j] - c*y);

subject to manhours: sum{i in vmod} sum{j in vconfig} (a[i,j]*x[i,j]) <= M+y;
subject to vehicle_count{i in vmod}: sum{j in vconfig} x[i,j] = N[i];
subject to add_manhours: y <= Q;

