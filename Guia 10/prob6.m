% problema 6
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
f_sym= sym(f);

%integrar analiticamente y graficar

F_sym = dsolve(diff(y) == -0.266*pb*Ph2*k0*K0*T*exp(QEa/(R*T))*y , y(0)==1)

F = function_handle(F_sym)
% Resolver por el metodo de Euler

y0=1;
a=0;
b=1;
h= (b-a)/20

x_real=[a:h:b];
y_real=F(x_real);
[x_e,y_e] = EDO_Euler(f,y0,a,b,h);
[x_rk4,y_rk4] = EDO_RK4(f,y0,a,b,h);

hold on
fplot(F,[0,1])
plot(x_e,y_e,'o')
plot(x_rk4,y_rk4,'o')
legend('Funcion original','Euler','RK4')
hold off

% zona efectiva hasta x = 0.25

