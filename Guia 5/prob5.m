%problema 5

pkg load symbolic
syms x y z
format long

f1 = x^2 + y^2 + z^2 - 9;
f2 = x * y * z - 1;
f3 = x + y - z^2;

F_sym= [f1;f2;f3];

X0 = [ 2.5 ; 0.2 ; 1.6];

tol = 1*10^-8;

imax = 20;

XR = NR5(F_sym, X0, tol, imax);


f_solve = @(X) [X(1)^2 + X(2)^2 + X(3)^2 - 9 ; X(1)*X(2)*X(3)-1 ; X(1) + X(2) - X(3)^2 ] ;
XR_solve = fsolve(f_solve, X0)


%Ahora inciso c con Broyden

X0c = [ 2.5 ; 0.2 ; 1.6];
XR_B = Broyden(F_sym,X0c,tol,imax)

% a ver Broyden inv

XR_Binv = Broyden_inv(F_sym,X0,tol,imax)
