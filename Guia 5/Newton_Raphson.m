

function XR_fsolve = Newton_Raphson (f1,f2,X0,tol,imax)

% f1,f2 funciones simbolicas
% X0 es punto inicial
pkg load symbolic
syms x y

F_sym = [f1;f2]
Fan = function_handle(F_sym)
F = @(X) Fan (X(1),X(2)) % lo vectorizo para que acepte vectores

J_sym= jacobian(F_sym)
Jan = function_handle(J_sym)

J = @(X) Jan(X(1),X(2));
J(X0);

for i=1:imax

  P = J(X0)\(-F(X0));
  XR = X0 + P;
  er = norm(F(XR),2);

  if er < tol
    disp(['convergencia'])
    XR
    i
    break
  endif

  X0 = XR;
endfor

XR_fsolve = fsolve(F,X0)
endfunction
