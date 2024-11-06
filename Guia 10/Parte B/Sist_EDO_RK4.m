function [x,y1,y2] = Sist_EDO_RK4 (f1,f2,y0_1,y0_2,a,b,h)

% Resuelve Sist. de EDO de 2 ecuaciones por el metodo RK4
% a es el punto inicial, b el punto final, h el paso, y0_1 e
% y0_2 son los puntos inciciales de f1 y f2 respectivamente

x = [a:h:b];
n = length(x);

y1 = zeros(1, n);
y2 = zeros(1, n);

y1(1)= y0_1;
y2(1)= y0_2;

for i=2:n

k1_1= f1(x(i-1), y1(i-1),y2(i-1));
k1_2= f2(x(i-1), y1(i-1),y2(i-1));
k2_1 = f1(x(i-1) + (h/2), y1(i-1) + (h/2)*k1_1, y2(i-1) + (h/2)*k1_2 );
k2_2 = f2(x(i-1) + (h/2), y1(i-1) + (h/2)*k1_1, y2(i-1) + (h/2)*k1_2 );
k3_1 = f1(x(i-1) + (h/2), y1(i-1) + (h/2)*k2_1, y2(i-1) + (h/2)*k2_2 );
k3_2 = f2(x(i-1) + (h/2), y1(i-1) + (h/2)*k2_1, y2(i-1) + (h/2)*k2_2 );
k4_1 = f1(x(i-1) + h, y1(i-1) + k3_1*h, y2(i-1) + k3_2*h);
k4_2 = f2(x(i-1) + h, y1(i-1) + k3_1*h, y2(i-1) + k3_2*h);

y1(i) = y1(i-1) + (h/6)*(k1_1 + 2*k2_1 + 2*k3_1 + k4_1);
y2(i) = y2(i-1) + (h/6)*(k1_2 + 2*k2_2 + 2*k3_2 + k4_2);

endfor
endfunction
