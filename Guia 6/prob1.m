%problema 1

clc
clear
close all

pkg load symbolic
syms x

f_sym = (-1.5*x^6)-(2*x^4)+(12*x);

%para optimmizar tengo que encontrar la raiz de f prima

fprim_sym = diff(f_sym,1);
fprim2_sym = diff(f_sym,2);

x0 = 0.9
XR = newton(fprim_sym,x0, 0.001, 0.001,10)

f=function_handle(f_sym)
fprim=function_handle(fprim_sym)
fprim2=function_handle(fprim2_sym)

xR_opt=newton_opt(fprim,fprim2,x0,0.001,5)

hold on
fplot(f,[-1 3 -2 10])   %que pasa con el grafico ?
fplot(fprim,[-1 3 -2 10])
hold off

xL= 0
xu= 2
dmax=1*10^-6
xopt_D = seccion_dorada(f,xL,xu,dmax,200)


