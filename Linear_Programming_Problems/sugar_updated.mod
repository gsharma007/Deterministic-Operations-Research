set SUGARS;
set SUPPLIERS;
param cost{SUPPLIERS};
param u;
param l;
param content{SUGARS, SUPPLIERS};

var Order{SUPPLIERS} >= 0;

minimize TotalCost: sum {j in SUPPLIERS} cost[j] * Order[j];
subject to TotalContentL {i in SUGARS}: 
		l * sum{j in SUPPLIERS} Order[j] <=
		sum {j in SUPPLIERS} content[i, j] * Order[j];
	
subject to TotalContentU {i in SUGARS}: 
		sum {j in SUPPLIERS} content[i, j] * Order[j] <= 
		u * sum{j in SUPPLIERS} Order[j];
		
subject to TotalWeight: 
		sum {j in SUPPLIERS} Order[j] = 1;	