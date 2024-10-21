
function XR_disc = NR_disc (F,X0,tol,imax)

% f1,f2 funciones simbolicas
% X0 es punto inicial

for i=1:imax
  J_D = Jac_gen(F,X0);
  P = linsolve(J_D,(-F(X0)));
  XR_disc = X0 + P;
  er = norm(F(XR_disc),2);

  if er < tol
     disp(['Se llego a la convergencia despues de ', num2str(i),' iteraciones'])
    XR_disc
    break
  endif
  X0 = XR_disc;
endfor

endfunction

