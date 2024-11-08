%problema 1

clc
clear
close all
format long

xdat = [1,2,2.5,3.8,5.6,7.1,8.4,9.2,10.5,12.6,15.2];
ydat = [0,0.69,0.91,1.33,1.72,1.96,2.12,2.21,2.35,2.53,2.72];
n = length(xdat);

% obtener el polinomio utilizando coef ind
P_ci = coef_indet(xdat,ydat)

%obtener el polinommio utilizando polyfit

pf= polyfit(xdat,ydat,n-1);
p_fit_sym = poly2sym(pf);
p_fit = function_handle(p_fit_sym)

hold on
plot(xdat,ydat,'o')
fplot(P_ci,[0 15.2],'r')
fplot(p_fit,[0,15.2])
plot(x2,y2_pf)
hold off


% estimaciones a distintos x
x1= 4.5;
x2= 14.5;

y1_ci = P_ci(x1)
y2_ci = P_ci(x2)

y1_pf = p_fit(x1)
y2_pf = p_fit(x2)

% % La primer estimación pareceria seguir una tendencia correcta
% en la segunda estimación, los polinomios de interpolación
% se desvian de la tendencia de los valores experimentales

