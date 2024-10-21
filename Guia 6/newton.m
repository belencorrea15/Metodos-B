function xR = newton (f,x0,tol,tolf,imax)

% f es una funcion simbolica
% x0 es la aproximacion de la raiz
%tol es el limite de tolerancia del error
%tolf es el limite de tolerancia de f evaluada
% imax es el numero maximo de iteraciones

pkg load symbolic
syms x

  fa = function_handle(f);
  df_sym = diff(f,1);
  dfa = function_handle(df_sym);

for i=1:imax %criterio de convergencia, iteraciones maximas
  xR = x0 - (fa(x0)/dfa(x0));
  f_xR = abs(fa(xR));
  error_ant = abs( xR - x0 )/ abs(xR+1*10^-10);

  %chequear criterios de convergencia
if f_xR < tolf && error_ant < tol
    disp(['El metodo converge, la raiz es ',num2str(xR)])
    disp(['Se realizaron ',num2str(i),' iteraciones'])
    break
  endif

  x0= xR;
endfor

endfunction
