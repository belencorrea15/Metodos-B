

function Ec = func_6 (y)

k = 1e-3;
Dab = 1.2e-9;

a= 0;
L= 1e-3;
b = L;
h= L/5;
x = [a:h:b];
n = length(x);

y_a= 0.2 ;
z_b= 0 ;

% Ecuacion del primer punto, dif finitas hacia adelante
Ec(1) = y(1) - y_a;

% Ecuaciones de los puntos intermedios, con centrales de orden h2
for i=2:n-1
Ec(i) = (k/Dab)*y(i) - ((y(i+1) - 2*y(i) + y(i-1))/h^2);
endfor

% Ecuacion para el punto final
Ec(n) = (3*y(n) - 4*y(n-1) + y(n-2))/2*h;
endfunction
