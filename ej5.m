% problema 5
% Belen Correa
clc
clear all
close all
pkg load symbolic
syms x

%inciso a
taya = taylor_polinomio(exp(x),0,3);

Aprox = taya(1)
Valor_Real= exp(1)
ETrunc = Valor_Real-Aprox

%inciso c
for i=1:100
  taya = taylor_polinomio(exp(x),0,i);
  Aprox = taya(1);
  Etrunc= Valor_Real-Aprox;
  if Etrunc < 0.0000001
    disp(['Se necesito un poli de orden, ',num2str(i)])
    break
  endif
endfor

% inciso b
f = exp(x)
x0 = 0
n=3
resto_sym = diff(f, n+1) * (x-x0)^(n+1) / factorial(n+1)
resto = function_handle(resto_sym)

limite_inf = resto(0);
limite_sup =resto(1);

if Etrunc >= limite_inf && Etrunc <= limite_sup
    disp('El error es superior al limite inferior y menor al limite superior')
    disp(['El limite inferior es: ', num2str(limite_inf)])
    disp(['El limite superior es: ', num2str(limite_sup)])
else
    disp('Hiciste algo mal')
end
