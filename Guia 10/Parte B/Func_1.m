

function Ec = Func_1 (y)

 a=0;
 b=2;
 h=0.5;
 x = [a:h:b];
 n = length(x);

 y_a=-3;
 y_b=1;

% Ecuacion del primer punto, dif finitas hacia adelante
Ec(1) = y(1) - y_a;

% Ecuaciones de los puntos intermedios, con centrales de orden h2
for i=2:n-1
Ec(i) = ((y(i+1) -2*y(i) + y(i-1))/(h^2)) - (2*((y(i+1)-y(i-1))/(2*h))) + y(i) + 3
endfor

% Ecuacion para el punto final
Ec(n) = y(n) - y_b;


endfunction
