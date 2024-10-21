%problema 10

clc
clear all
close
warning("off","all")
pkg load symbolic
syms x y


f1 = 100*0.3 - 70*x - 30*y;
f2 = y - ((exp((0.89-x)*((1.3925*x^2)-3.0243*x+2.7473))*x)/(1+(exp((0.89-x)*((1.3925*x^2)-3.0243*x+2.7473))-1)*x));

F_sym = [f1;f2];
Fan = function_handle(F_sym);
F = @(X) Fan (X(1),X(2));

hold on
ezplot(f1,[0 1 0 1])
ezplot(f2, [ 0 1 0 1 ])
hold off


% Graficamente puedo ver que la comp aprox del líquido y del vapor es en
% (0.2 , 0.53)

X0 = [0.2;0.5];
tol = 1*10^-8;
imax = 20;

XR_B = Broyden(F_sym,X0,tol,imax);

XR_disc = NR_disc(F,X0,tol,imax);

XR_solve = fsolve(F,X0);

