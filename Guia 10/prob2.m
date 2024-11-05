% problema 2

clc
clear all
close
f = @(x,y) -2*x.^3 + 12*x.^2 -20*x + 8.5;

y0 = 1;
F = @(x,y) -(1/2)*2*x.^4 + 4*x.^3 -10*x.^2 + (17/2)*x +1;

h = 0.5;
a = 0;
b = 1.5;

[x,y_e] = EDO_Euler(f,y0,a,b,h);
y_real = F(x);
[x,y_h] = EDO_Heun(f,y0,a,b,h);
[x,y_pm] = EDO_PM(f,y0,a,b,h);
[x,y_rk4] = EDO_RK4(f,y0,a,b,h);

disp('Valores de x')
disp(x)

disp('Y Euler')
disp(y_e)

disp('Y Heun')
disp(y_h)

disp('Y punto medio')
disp(y_pm)

disp('Y RK4')
disp(y_rk4)

disp('Y real')
disp(y_real)

% problema 3

[x,y_rk45] = ode45(f,[a:0.5:b],y0);

disp('Y RKF45')
disp(y_rk45)

%No son muy distintos los valores

