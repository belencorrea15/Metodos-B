function XR_fsolve = Newton_Raphson2 (f1,f2,X0,tol,imax)

warning("off","all")
pkg load symbolic
syms x y

F_sym = [f1;f2];
Fan = function_handle(F_sym);
F = @(X) Fan (X(1),X(2)); % lo vectorizo para que acepte vectores

J_sym= jacobian(F_sym);
Jan = function_handle(J_sym);

J = @(X) Jan(X(1),X(2));
J(X0);

num_aux = 1.0e-10;

for i=1:imax

  P = inverse(J(X0)) * (-F(X0));
  XR = X0 + P;
  error_rel_aprox = norm(XR - X0,2) / (norm(X0,2)+num_aux);

  if error_rel_aprox < tol
    disp(['convergencia'])
    XR
    i
    break
  endif

  X0 = XR;
endfor

XR_fsolve = fsolve(F,X0)

endfunction
