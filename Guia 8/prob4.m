%problema 4

clc
clear
close all

xdat = [200, 250, 300, 350, 400];
ydat = [7.5, 8.6, 8.7, 10.0, 11.3];
n = length(xdat);

% interpolar linealmente los valores apropiados para obtener
% el porc de elong a 375. Comando especifico
x1= 375
elong_interp = interp1([xdat(4),xdat(5)],[ydat(4),ydat(5)],x1,'linear')

% obtener el polinomio utilizando coef ind
P_ci = coef_indet(xdat,ydat)
elong_ci = P_ci(x1)

hold on
plot(xdat,ydat,'o')
fplot(P_ci,[200,400])
plot(x1,elong_ci,'o')
plot(x1,elong_interp,'o')
hold off

% La interpolacion utilizando coef indet es mas exacta
% ya que ajusta todos los datos con un polinomio de mayor orden


% La interpolacion lineal solo tiene en cuenta 2 datos, y encima
% lo ajusta mediante una recta

