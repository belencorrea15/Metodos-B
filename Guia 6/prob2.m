%problema 2

clc
clear
close all

pkg load symbolic
syms x

f_sym = (-x^4)-(2*x^3)-(8*x^2)-5*x;

%para optimmizar tengo que encontrar la raiz de f prima

fprim_sym = diff(f_sym,1);
fprim2_sym = diff(f_sym,2);

hold on
fplot(f_sym,[-1 1 -2 2])   %que pasa con el grafico ?
fplot(fprim_sym,[-1 1 -2 2])
hold off

x0 = -0.3
f=function_handle(f_sym)
fprim=function_handle(fprim_sym)
fprim2=function_handle(fprim2_sym)

xR_opt=newton_opt(fprim,fprim2,x0,0.001,10)
