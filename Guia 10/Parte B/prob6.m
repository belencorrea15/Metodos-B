% problema 6

clc
clear
close all

k = 1e-3;
Dab = 1.2e-9;

a= 0;
L= 1e-3;
b = L;
h= L/5;
x = [a:h:b];
n = length(x);

f1 = @(x,y,z) z ;
f2 = @(x,y,z) (k/Dab) * y ;

y_a= 0.2 ;
z_b= 0 ;

% para los disparos supongo z_a

z_a1 = -100;

[x,y,z] = Sist_EDO_RK4(f1,f2,y_a,z_a1,a,b,h);
z_b1 = z(end);

z_a2 = -200;

[x,y,z] = Sist_EDO_RK4(f1,f2,y_a,z_a2,a,b,h);
z_b2 = z(end);

% interpolacion
datos_za = [z_a1,z_a2];
datos_zb = [z_b1,z_b2];

z_a3 = interp1(datos_zb,datos_za,z_b,'linear');

[x_rk4,y_rk4,z_rk4] = Sist_EDO_RK4(f1,f2,y_a,z_a3,a,b,h);
z_b3 = z(end);

% diferencias finitas

y0(1:n)=1;

y_dif = fsolve(@func_6,y0);


%Solucion verdadera
Y = @(x) 0.2 * (cosh(b*sqrt((k/Dab))*(1-(x/b)))/(cosh(b*sqrt((k/Dab)))));

hold on
plot(x,y_rk4,'o')
fplot(Y,[0 L])
plot(x,y_dif,'*')
legend('RK4','Sol. Verdadera','Dif finitas')
hold off
