% problema 9

clc
clear
close

pkg load symbolic
syms x(t) z(t)

fd = @(t,x,z) z;
fd2 = @(t,x,z) -2*z -10*x;


%y(1) es x
%y(2) es z

x0=10;
z0=0;
h=0.02;
a=0;
b=0.2;

%inciso a, uso metodo RK4

[t_rk4,x_rk4,z_rk4] = Sist_EDO_RK4(fd,fd2,x0,z0,a,b,h);

disp(['El valor de x en t = 0.1 es ', num2str(x_rk4(6))])
disp(['El valor de x en t = 0.2 es ', num2str(x_rk4(11))])

%inciso b, resuelvo analiticamente

ec1 = sym(fd)
ec2 = sym(fd2)

sol = dsolve([diff(x) == z, diff(z) == -2*z-10*x],x(0)==10,z(0)==0);
x_dsolve_s = sol.x;
z_dsolve_s = sol.z;

x_dsolve=function_handle(x_dsolve_s)
z_dsolve=function_handle(z_dsolve_s)

% inciso c

% y(1) representa X
% y(2) representa Z
F = @(t,y) [ y(2) ; -2.*y(2) - 10.*y(1)];
Y0 = [x0,z0];

int_tiempo= [0 0.2];

[t_s,y_s]= ode45(F,int_tiempo,Y0);

hold on
fplot(x_dsolve,[0 0.2])
plot(t_rk4,x_rk4,'o')
plot(t_s,y_s(:,1))
legend('Solucion analitica','Metodo RK4','Metodo RKF45')
hold off
