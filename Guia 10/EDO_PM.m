

function [x,y] = EDO_PM(f,y0,a,b,h)

x = [a:h:b];
n = length(x);

% Creo el vector y
y = zeros(1,n);
% Cargo el valor inicial
y(1) = y0;

for i=2:n

%Usa Euler para calcular la pendiente a mitad del paso
x_p = x(i-1)+h/2;
y_p = y(i-1) + (h/2)*f(x(i-1),y(i-1));

%utiliza la pendiente del punto medio para todo el intervalo
y(i) = y(i-1) + h*f(x_p,y_p);

endfor

endfunction
