%problema 2

clc
clear
close all

pkg load symbolic
syms x

f_sym = 3 + 6*x + 5*x^2 + 3*x^3 + 4*x^4;

%para optimmizar tengo que encontrar la raiz de f prima

fprim_sym = diff(f_sym,1);
fprim2_sym = diff(f_sym,2);

hold on
fplot(f_sym,[-2 2 -2 3])   %que pasa con el grafico ?
fplot(fprim_sym,[-2 2 -2 3])
hold off

x0 = -0.58;
f=function_handle(f_sym);
fprim=function_handle(fprim_sym);
fprim2=function_handle(fprim2_sym);

xR_opt=newton_opt(fprim,fprim2,x0,0.00001,10)

%metodo dorado
xL= -0.62;
xu= -0.54;
dmax=1*10^-6;
xopt_d=seccion_dorada(f,xL,xu,dmax,100)
