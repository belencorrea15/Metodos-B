

function XR_Binv = Broyden_inv (F_sym,X0,tol,imax)

%evita calcular Br\-F(xi) --> menor carga computacional
% X Y Z
% F es directamente la matriz de funciones
pkg load symbolic
syms x y z

num_aux = 1.0e-8;
Fan = function_handle(F_sym);
F = @(X) Fan (X(1),X(2)); % lo vectorizo para que acepte vectores

J_sym= jacobian(F_sym);
Jan = function_handle(J_sym);

J = @(X) Jan(X(1),X(2)); % lo vectolizo para que acepte vectores
Br=J(X0); % LO EVALUO SOLO UNA VEZ PARA LA PRIMERA ITERACION

% calculo solamente una vez la inversa del jacobiano evaluada en xi

H = inverse(J(X0));

for i=1:imax

 P = -H*F(X0);
 XR_Binv = X0 + P ;
 error_rel_aprox = norm(XR_Binv - X0,2) / (norm(X0,2)+num_aux);

 if error_rel_aprox < tol
    disp(['Se llego a la convergencia despues de ', num2str(i),' iteraciones'])
    XR_Binv
    break
  endif

  Y = F(XR_Binv)-F(X0) ;
  H = H + (P-H*Y)*((transpose(P)*H/(transpose(P)*H*Y)));
  X0 = XR_Binv;
 endfor

endfunction
