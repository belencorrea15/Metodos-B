
function [x,y] = EDO_Heun(f,y0,a,b,h)

x = [a:h:b];
n = length(x);

% Creo el vector y
y = zeros(1,n);
% Cargo el valor inicial
y(1) = y0;

for i=2:n
y_p = y(i-1) + h*f(x(i-1),y(i-1));

y(i) = y(i-1) + (((f(x(i-1),y(i-1)) + f(x(i),y_p)))/2)*h;
endfor

endfunction
