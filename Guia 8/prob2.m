clc
clear
close all

xdat = [1,2,3,4,5,6]
ydat = [3,6,19,99,291,444]
n = length(xdat)

P_ci = coef_indet(xdat,ydat)

pf= polyfit(xdat,ydat,n-1);
p_fit_sym = poly2sym(pf);
p_fit = function_handle(p_fit_sym)


% b) calcular f(4)

x1=4;
y_ci= P_ci(x1)
y_pf = p_fit(x1)


%Si el polinomio de interpolación de orden 5 es exacto, entonces la función
%f(x) es un polinomio de grado 5 o de un grado menor (0, 1, 2, 3, 4).
