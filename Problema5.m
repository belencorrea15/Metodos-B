 % Maria Belen Correa
 % Problema 5

 clc
 clear all
 close all
 format long

 x=[0:0.1:3.2];
 y = x.^3-5*x.^2+6*x+0.55;

 %ACORDATE DE PONER .^3 PARA QUE SEA ELEMENTO A ELEMENTO

 plot(x,y);

 x1=2.73;
 y1 = x1.^3-5*x1.^2+6*x1+0.55;


 %inciso d

yverdadero= y1;

y2dig=-0.45;
y5dig=0.012;

error2dig= 100*abs((y2dig-yverdadero)/yverdadero);
error5dig= 100*abs((y5dig-yverdadero)/yverdadero);

disp(['el error usando 2 digitos es ',num2str(error2dig),' %'])
disp(['el error usando 5 digitos es ',num2str(error5dig),' %'])

 % ahora la funcion equivalente

 yb = @(x)((x-5).*x+6).*x + 0.55;

 hold on

 fplot(yb,[0,3.2],'r')

 hold off

 y2=yb(2.73);

yb2dig=-0.010;
yb5dig=0.011920;

error2digb= 100*abs((yb2dig-y2)/y2);
error5digb= 100*abs((yb5dig-y2)/y2);

disp(['el error usando 2 digitos es ',num2str(error2digb),' % con la funcion equivalente'])
disp(['el error usando 5 digitos es ',num2str(error5digb),' % con la funcion equivalente'])

% Ambas funciones son equivalentes en términos de cálculo pero las diferencias
% pueden surgir debido a cómo se realizan las operaciones y cómo se
% manejan los errores de redondeo en cada caso.


% yb(x) esta escrita de manera factorizada y utiliza redondeo y ajustes de
% punto flotante.

