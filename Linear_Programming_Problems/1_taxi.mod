set area;
set vtype;

param D{area};
param S{vtype};
param profit{area,vtype};

#number of vehicles typejassigned to areai.
var x{area,vtype} >=0;

maximize z: sum{i in area} sum{j in vtype} profit[i,j]*x[i,j];

subject to min_requirment{i in area}: sum{j in vtype} x[i,j] >= D[i];
subject to availability{j in vtype}: sum{i in area} x[i,j] <= S[j];
