%problema 4
clc
clear
close all

pkg load symbolic
syms x

f_sym = -11.81*x^3 + 3.8474*x^2 + 2.4177*x + 0.2295;

%para optimmizar tengo que encontrar la raiz de f prima

fprim_sym = diff(f_sym,1);
fprim2_sym = diff(f_sym,2);

hold on
ezplot(f_sym,[0 0.5 -1 1])   %que pasa con el grafico ?
ezplot(fprim_sym,[0 0.5 -1 2])
hold off

%raiz en 0.37 aprox

x0 = 0.37;
f=function_handle(f_sym);
fprim=function_handle(fprim_sym);
fprim2=function_handle(fprim2_sym);

xR_opt=newton_opt(fprim,fprim2,x0,0.00001,10)

%ahora con la secante

x0s=0.4;
x_menos1=0.3;
xR_opt_sec=secante_opt(fprim,x0s,x_menos1,0.000001,10)

% El caudal volumetrico critico es 0.3915

P_crit = f(xR_opt_sec)

% El respectivo consumo de potencia es 1.0571

% es un maximo
