% Belen Correa
% problema 7, inciso d

clear
close all
clc

pkg load symbolic
syms x

f_sym = cos(x);
f = function_handle(f_sym);
x0 = 1; %punto base
n = 5; %orden del polinomio

% Calculo el polinomio de grado 5
Tay5 = taylor_polinomio(f_sym,x0,n);

Xmin = x0;
Xmax = x0;
Error_cota = 1;

% Lazo hacia adelante:
for xa = x0:0.01:x0 + 10
  % calculo el valor real y el valor aprox
  v_real = f(xa);
  v_aprox = Tay5(xa);

  % Error relativo
  Error_relat_por = abs((v_real - v_aprox)/v_real)*100;

  if Error_relat_por < Error_cota
    Xmax = xa; %se actualiza el límite sup
  else
    break % se sale del lazo si e es mayor al Er
  endif
endfor

% Lazo hacia atrás (seria para el xmin)
for xb = x0 + 10:-0.01:x0

  v_real2 = f(xb);
  v_aprox2 = Tay5(xb);
  Error_relat_por2 = abs((v_real2 - v_aprox2)/v_real2)*100;

  if Error_relat_por2 < Error_cota
    Xmin = xb; %se actualiza el límite sup
  else
    break % se sale del lazo si el e es mayor al Er
  endif
endfor

disp(['El Xmin es ', num2str(Xmin),' y el Xmax es ', num2str(Xmax)])


