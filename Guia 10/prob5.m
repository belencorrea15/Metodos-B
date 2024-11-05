%problema 5

clc
clear all
close

f1 = @(x,y1,y2) -0.5*y1
f2 = @(x,y1,y2) 4 -3*y2 -0.1*y1

y0_1 = 4
y0_2 = 6

a=0
b=5
h=0.5

[x,y1,y2] = Sist_EDO_Euler(f1,f2,y0_1,y0_2,a,b,h);
[x_rk4,y1_rk4,y2_rk4] = Sist_EDO_RK4(f1,f2,y0_1,y0_2,a,b,h);

hold on
plot(x,y1)
plot(x,y2)
plot(x,y1_rk4)
plot(x,y2_rk4)
legend('y1 Euler','y2 Euler','y1 RK4','y2 RK4')
hold off


