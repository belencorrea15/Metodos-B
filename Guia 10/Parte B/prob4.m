%problema 4

clc
clear
close

f1 = @(x, y, z) z;
f2 = @(x, y, z) 4 - (1/8).*z.*y;
y_a = 17;
a=1; % punto de inicio
b=3; % punto final
h=0.2;
y_b = 14.3;

% disparo 1

z_a1= -10;

[x_rk4,y_rk4,z_rk4] = Sist_EDO_RK4(f1,f2,y_a,z_a1,a,b,h);
y_b1 = y_rk4(end);

% disparo 2

z_a2= -15;

[x_rk4,y_rk4,z_rk4] = Sist_EDO_RK4(f1,f2,y_a,z_a2,a,b,h);
y_b2 = y_rk4(end);

% interpolacion
z_a3 = (z_a2-z_a1)/(y_b2-y_b1)*(y_b-y_b1)+z_a1;
% disparo 3
[x_rk4,y_rk4,z_rk4] = Sist_EDO_RK4(f1,f2,y_a,z_a3,a,b,h);
y_b3= y_rk4(end);

z_a4 = (z_a3-z_a2)/(y_b3-y_b2)*(y_b-y_b2)+z_a2;
[x_rk4,y_rk4,z_rk4] = Sist_EDO_RK4(f1,f2,y_a,z_a4,a,b,h);

% Ahora con diferencias finitas

x = [a:h:b]; % Vector de puntos x
n = length(x); % Número de puntos
x0(1:n) = 1;
Ec = f_prob4(x0);

y_finitas = fsolve(@f_prob4,x0);


hold on
plot(x_rk4,y_rk4,'o')
plot(x,y_finitas,'o')
legend('RK4','Dif finitas')
hold off

