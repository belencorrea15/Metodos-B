% problema 6 inciso e

clc
clear
close

pkg load symbolic
syms y(x)

Ph2 = 685; % Presión parcial de H2
k0 = 4.22; % Constante
K0 = 2.63e-6; % Constante
T = 150 + 273.15; % Temperatura absoluta (K)
pb = 1.2; % Densidad del catalizador
R = 1.987; % Constante de los gases
QEa = 2700; % Energía de activación
tita= 0.266;

f = @(x,y) -0.266*pb*Ph2*k0*K0*T*exp(QEa/(R*T))*y;

y0=1;
a=0;
b=0.25;
h= (b-a)/20

%integrar analiticamente y graficar

F_sym = dsolve(diff(y) == -0.266*pb*Ph2*k0*K0*T*exp(QEa/(R*T))*y , y(0)==1)
F = function_handle(F_sym)

x=[a:h:b];
n=length(x)
y_real=F(x);


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

Error = y_real(i) - y(i)
endfor

hold on
fplot(F,[0 0.25])
plot(x,y,'o')
hold off

