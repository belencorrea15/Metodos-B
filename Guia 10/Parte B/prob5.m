% Problema 5

clc
clear
close

%Ecuacion diferencial:
%  100*d^2c/dx^2 - 100*dc/dx - 2*c
% Condiciones de borde:
% 1) c(0) = ( 100*100 + 5000*dc(0)/dx )/100
% 2) dc(L)/dx = 0

a = 0;
b = 100;
h = 10;
x=[a:h:b];
n=length(x);

c0(1:n) = 1; % Valor inicial para el solver
c = fsolve(@func_5,c0)

c_v = [62.177,55.082,48.863,43.439,38.744,34.73,31.371,28.661,26.626,25.322,24.855];

hold on
plot(x,c)
plot(x,c_v)
legend('Diferencias finitas','Solucion analitica')
hold off
