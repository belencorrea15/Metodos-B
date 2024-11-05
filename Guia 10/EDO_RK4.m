function [x,y] = EDO_RK4(f,y0,a,b,h)

x = [a:h:b];
n = length(x);

% Creo el vector y
y = zeros(1,n);
% Cargo el valor inicial
y(1) = y0;

for i=2:n

k1 = f(x(i-1), y(i-1));
k2 = f(x(i-1) + (h/2), y(i-1) + (h/2)*k1);
k3 = f(x(i-1) + (h/2), y(i-1) + (h/2)*k2);
k4 = f(x(i-1) + h, y(i-1) + k3*h);

y(i) = y(i-1) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
endfor

endfunction


