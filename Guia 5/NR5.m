
function XR = NR5 (F_sym,X0,tol,imax)

  % X Y
  % F es directamente la matriz de funciones


pkg load symbolic
syms x y

Fan = function_handle(F_sym);
F = @(X) Fan (X(1),X(2)); % lo vectorizo para que acepte vectores

J_sym= jacobian(F_sym);
Jan = function_handle(J_sym);

J = @(X) Jan(X(1),X(2));
J(X0);

num_aux = 1.0e-8;

for i=1:imax

  P = inverse(J(X0)) * (-F(X0));
  XR = X0 + P;
  error_rel_aprox = norm(XR - X0,2) / (norm(X0,2)+num_aux);

  if error_rel_aprox < tol
    disp(['Se llego a la convergencia despues de ', num2str(i),' iteraciones'])
    XR
    break
  endif

  X0 = XR;
endfor

endfunction
