% problema 7
% Belen Correa

pkg load symbolic
syms x y z t

f1 =  4*x - y + z -x*t;
f2 = -x + 3*y - 2*z - y*t;
f3 = x - 2*z + 3*z - z*t;
f4 = x^2 + y^2 + z^2 - 1;

F_sym= [f1;f2;f3;f4];
Fan = function_handle(F_sym);
F = @(X) Fan (X(1),X(2),X(3),X(4));
X0 = [ 1 ; 1 ; 1 ; 1];
X02 = [ 1 ; 1 ; 1 ; 1];

tol = 1*10^-8;
imax = 20;

%XR = NR7(F_sym,X0,tol,imax)

%XR_B = Broyden(F_sym,X02,tol,imax)

%XR_Binv= Broyden_inv(F_sym,X02,tol,imax)

XR_disc = NR_disc(F,X0,tol,imax)
