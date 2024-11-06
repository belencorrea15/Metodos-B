function Ec = func_2 (y)

 a=2;
 b=4;
 h=0.2;
 y_a= 110;
 y_b= 0;
 x = [a:h:b];
 n = length(x);

% Ecuacion del primer punto, dif finitas hacia adelante
Ec(1) = y(1) - y_a;

% Ecuaciones de los puntos intermedios, con centrales de orden h2
for i=2:n-1
Ec(i) = ((y(i+1) -2*y(i) + y(i-1))/(h^2)) + ((2/x(i))*((y(i+1)-y(i-1))/(2*h)));
endfor

% Ecuacion para el punto final
Ec(n) = y(n) - y_b;
endfunction
