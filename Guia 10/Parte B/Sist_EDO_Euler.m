

function [x,y1,y2] = Sist_EDO_Euler (f1,f2,y1_0,y2_0,a,b,h)
% Resuelve Sist. de EDO de 2 ecuaciones por el metodo de Euler
% a es el punto inicial, b el punto final, h el paso, y0_1 e
% y0_2 son los puntos inciciales de f1 y f2 respectivamente

x = [a:h:b];
n = length(x);

y1(1)= y1_0;
y2(1)= y2_0;

for i=2:n

y1(i) = y1(i-1) + h*f1(x(i-1),y1(i-1),y2(i-1));
y2(i) = y2(i-1) + h*f2(x(i-1),y1(i-1),y2(i-1));

endfor

endfunction


