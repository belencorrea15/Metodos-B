% problema 7
%inciso c
% Belen Correa
clc
clear all
close all
pkg load symbolic
syms x

warning('off', 'OctSymPy:sym:rationalapprox')

f = x^4+4*x+5+cos(x)
fa = function_handle(f);
Vreal= fa(3);
x0=1;

for i=1:10

Taya = taylor_polinomio(f,x0,i);
Aprox = Taya(3);
Valor_relat = (Vreal-Aprox)/Vreal;

if Valor_relat < 0.001
  disp(['Corto en n= ',num2str(i)])
  break
endif

endfor










