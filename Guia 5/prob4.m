% Belen Correa
% ejercicio 4

clc
clear all
close
warning("off","all")


pkg load symbolic
syms x y

f1 = 1.38*x + 2.58*y - 0.1
f2 = 4.03*x - 5.12*y - 2.3

hold on
ezplot(f1,[-2 2 -2 2])
ezplot(f2,[-2 2 -2 2])
hold off

X0 = [1;1];
imax = 10
tol = 0.0000001

XR_fsolve = Newton_Raphson4(f1,f2, X0, tol, imax)

% Da lo mismo para cualquier x0
% En el caso de un sistema lineal, el Jacobiano es constante y no cambia
% a medida que se realizan iteraciones
% por lo que el metodo converge directamente a la solucion

% converge en 2 porque usa error relativo y requiere 2 iteraciones
