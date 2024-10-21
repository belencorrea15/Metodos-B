% Belen Correa
% ejercicio 2

clc
clear all
close

pkg load symbolic
syms x y

f1 = (x-1)^2 + (y-1)^2 -1
f2 = x-y

X0 = [0;0];

imax = 20
tol = 0.001

XR_fsolve = Newton_Raphson2(f1,f2, X0, tol, imax)

% Al utilizar [1;1] como x0 el J que es [2(x1−1),​ 2(x2−1); 1, −1] se
% convierte en singular (arriba es 0, 0). Es por esto que no se puede
% resolver fsolve, es decir no sirven aquellos valores de x1=x2=1,
% ya que hacen que J sea singular


