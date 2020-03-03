param n; #number of pasta types
param m; #number of resources/ingredients 
param c{1..n}; #objective function cost i.e. profits per batch per pasta type
param b{1..m}; #limit for ingredients(maximum amount)
param a{1..m,1..n}; #amount of ingredient j used to ake 1 batch of pasta i

var x{1..n}; #number of batches of pasta i to be produced

maximize TotalProfit: sum{i in 1..n}c[i]*x[i];

subject to AvailableResources{j in 1..m}: sum {i in 1..n} a[j,i]*x[i] <= b[j];
subject to Nonneg{i in 1..n}: x[i] >= 0;

