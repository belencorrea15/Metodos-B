% problema 7
%inciso b
% Belen Correa
clc
clear all
close all
pkg load symbolic
syms x

x0=1;

taya1 = taylor_polinomio(x^4+4*x+5,x0,1)
taya2 = taylor_polinomio(x^4+4*x+5,x0,2)
taya3 = taylor_polinomio(x^4+4*x+5,x0,3)

hold on
fplot(taya1,[-5 5])
fplot(taya2,[-5 5])
fplot(taya3,[-5 5])
hold off
