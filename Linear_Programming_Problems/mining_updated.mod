set SITE;   	# Sites
set MARKET;   	# Markets

param s {SITE};   			# amounts available at sites
param d {MARKET};   		# amounts required at markets

param c {SITE, MARKET};   	# shipment costs per unit by rail
param p {SITE, MARKET}; 	# shipment costs per unit by ship
param v	{SITE, MARKET};		# invesment costs
param V;					# invesment limitation



var X {SITE, MARKET} >= 0;     	# units to be shipped by rail
var	Y {SITE, MARKET} >= 0;		# units to be shipped by ship



minimize Total_Cost: 			# using both rail and ship
	sum {i in SITE, j in MARKET} (c[i,j] * X[i,j]) + 
	sum {i in SITE, j in MARKET} ((p[i, j] + v[i, j]) * Y[i, j]) ; 


subject to Supply {i in SITE}:	#using both rail and ship
   sum {j in MARKET} X[i,j] + sum {j in MARKET} Y[i,j] <= s[i];

 
     
subject to Demand {j in MARKET}:	#using both rail and ship
   sum {i in SITE} X[i,j] + sum {i in SITE} Y[i,j] >= d[j];     
   
subject to Invesment_Limitation: 
	sum {i in SITE, j in MARKET} v[i, j] * Y[i, j] <= V; 