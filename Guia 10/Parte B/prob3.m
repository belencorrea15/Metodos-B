% problema 3

clc
clear all
close

% A es y
K=4*10.0e-6;
D=10.0e-6;
f1 = @(x, y, z) z;
f2 = @(x, y, z) (K.*y)./D

y_a = 0.1
a=0;
b=4;
h=0.1;
y_b = 0

% disparo 1

z_a1= -0.5

[x,y,z] = Sist_EDO_RK4(f1,f2,y_a,z_a1,a,b,h);
y_b1 = y(end)

%disparo 2

z_a2= -0.3

[x,y,z] = Sist_EDO_RK4(f1,f2,y_a,z_a2,a,b,h);
y_b2 = y(end)

% interpolacion

z_a3 = (z_a2-z_a1)/(y_b2-y_b1)*(y_b-y_b1)+z_a1
[x,y,z] = Sist_EDO_RK4(f1,f2,y_a,z_a3,a,b,h);

plot(x,y)

