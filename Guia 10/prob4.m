% Problema 4

clc
clear all
close

f=@(x,y) 10*exp((-(x-2)^2)/(2*(0.075^2)))-0.6*y;

y0 = 0.5;
a=0;
b=4;

h1=1;
h2=0.25;
h3=0.001;

%inciso a
[x_rk4_h1,y_rk4_h1]= EDO_RK4(f,y0,a,b,h1);
[x_rk4_h2,y_rk4_h2]= EDO_RK4(f,y0,a,b,h2);
[x_rk4_h3,y_rk4_h3]= EDO_RK4(f,y0,a,b,h3);
%inciso b
[x_rkf45,y_rkf45]= ode45(f,[a,b],y0);

hold on
plot(x_rk4_h1,y_rk4_h1)
plot(x_rk4_h2,y_rk4_h2)
plot(x_rk4_h3,y_rk4_h3)
plot(x_rkf45,y_rkf45)
legend('RK4 h1=1','RK4 h2=0.25','RK4 h3=0.001','RKF45 paso variable')
hold off


