%problema 8
%Belen Correa

clc
clear all
close

pkg load symbolic
syms x y
format long

K1=4*10^-4;
K2=3.7*10^-2;
Cao=50;
Cbo=20;
Cco=5;
Cdo=10;
tol = 1*10^-8;
imax = 20;

f1 = ((Cco+x+y)/((Cao-2*x-y)^2*(Cbo-x)))-K1;
f2 = ((Cco+x+y)/((Cao-2*x-y)*(Cdo-y)))-K2;

F_sym=[f1;f2];

hold on
ezplot(f1,[0 15 0 5])
ezplot(f2,[0 15 0 5])
hold off

X0=[3;2];

XR = NR5(F_sym,X0,tol,imax);
XR_B = Broyden(F_sym,X0,tol,imax);
XR_Binv=Broyden_inv(F_sym,X0,tol,imax);

f_solve = @(X) [((Cco+X(1)+X(2))/((Cao-2*X(1)-X(2))^2*(Cbo-X(1))))-K1 ; ((Cco+X(1)+X(2))/((Cao-2*X(1)-X(2))*(Cdo-X(2))))-K2 ];
XR_solve = fsolve(f_solve,X0)
