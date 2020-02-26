set market;
set mill;

param c{mill};
param b{mill};
param d{market};
param r{market,mill};

#tons of newsprint produced by mill j shipped to market i
var x{market,mill} >=0;

maximize z: sum{i in market} sum{j in mill} (c[j]*x[i,j] + r[i,j]*x[i,j]);

subject to prodcap{j in mill}: sum{i in market} x[i,j] <= b[j];
subject to demand{i in market}: sum{j in mill} x[i,j] >= d[i];
 