

function Ec = f_prob4 (y)

% Genero una funcion con las ecuaciones reemplazadas por diferencias finitas
% y son las incognitas que se van a hallar con el fsolve

y_a = 17;
a=1; % punto de inicio
b=3; % punto final
h=0.2;
y_b = 14.3;

x = [a:h:b];
n = length(x);

% Ecuacion del primer punto, dif finitas hacia adelante
Ec(1) = y(1) - y_a;

% Ecuaciones de los puntos intermedios, con centrales de orden h2
for i=2:n-1
Ec(i) = ((y(i+1) -2*y(i) + y(i-1))/h^2) - 4 + (1/8)*((y(i+1)-y(i-1))/2*h)*y(i);
endfor

% Ecuacion para el punto final
Ec(n) = y(n) - y_b;

endfunction
