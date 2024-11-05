% problema 10

clc
clear
close

k1 = 0.06;
k2 = 0.015;
Ca0=1;
Cb0=0.25;

a=0;
b=100;
h=10;
X0=0;

% metodo numerico

df = @(t,X) k1*(1-X)-k2*((Cb0/Ca0)+X);

[t,X] = EDO_RK4(df,X0,a,b,h);

% Solucion analitica

u = (k1 - k2*(Cb0/Ca0))/(k1+k2);
F = @(t) u*( 1 - exp(-(k1+k2)*t))

hold on
plot(t,X,'o')
fplot(F,[0 100])
legend('Solucion numerica','Solucion analitica')
hold off

% es muy confiable el metodo utilizado

% Aumento inicial: Al comienzo de la reacción (cuando t=0),
% X aumenta rápidamente debido a que inicialmente solo hay reactivo A,
% y la reacción procede en la dirección hacia B.
% Aproximación al equilibrio: A medida que la reacción avanza,
% la velocidad de la reacción hacia adelante disminuye (ya que el reactivo
% A se consume), y la reacción inversa comienza a ser más significativa.
% Esto hace que el crecimiento de X disminuya.
% Estabilización: Finalmente, el sistema alcanza un punto de
% equilibrio donde la concentración de A y B ya no cambia,
% resultando en una conversión X constante de aproximadamente 0.75.
