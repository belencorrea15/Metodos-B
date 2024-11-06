

function Ec = func_5 (c)

D = 5000;
L = 100;
a = 0;
b = L;

U = 100;
Cin = 100; % no es lo mismo que C en x=0
k = 2;

h=(b-a)/10;
x= [a:h:b];
n= length(x);

% Ecuacion de borde inicial, dif finitas hacia adelante
Ec(1)  = c(1) - ((U*Cin + D*((-c(3)+ 4*c(2) -3*c(1)) / (2*h)))/U);
% Ecuaciones de los puntos intermedios, con centrales de orden h2
for i=2:n-1
Ec(i) = D*((c(i+1) -2*c(i) + c(i-1))/h^2 ) - (U*( c(i+1) - c(i-1) )/ (2*h)) - k*c(i);
endfor
% Condicion final, dif finitas hacia atras
Ec(n) = (3*c(n) - 4*c(n-1) + c(n-2))/2*h;

endfunction
