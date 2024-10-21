

function XR_B = Broyden (F_sym,X0,tol,imax)

% X Y Z
% F es directamente la matriz de funciones
pkg load symbolic
syms x y z t

num_aux = 1.0e-8;
Fan = function_handle(F_sym);
F = @(X) Fan (X(1),X(2)); % lo vectorizo para que acepte vectores

J_sym= jacobian(F_sym);
J_sym(1,1) = J_sym(1,1) + y/10^10; %esto por si el jacobiano no tiene
%variables para evaluar

Jan = function_handle(J_sym);

J = @(X) Jan(X(1),X(2)); % lo vectolizo para que acepte vectores
Br=J(X0); % LO EVALUO SOLO UNA VEZ PARA LA PRIMERA ITERACION

for i=1:imax

  P = Br \ -F(X0);
  XR_B = X0 + P ;
  error_rel_aprox = norm(XR_B - X0,2) / (norm(X0,2)+num_aux);

  if error_rel_aprox < tol
    disp(['Se llego a la convergencia despues de ', num2str(i),' iteraciones'])
    XR_B
    break
  endif

  Y = F(XR_B)-F(X0) ;
  Br = Br + (Y - Br*P)*(transpose(P)/(transpose(P)*P));
  X0 = XR_B;

endfor
endfunction
