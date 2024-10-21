

function xR = newton7 (f,x0,tolv,vreal,imax)

% f es una funcion simbolica
% x0 es la aproximacion de la raiz
%tolv es el limite de tolerancia del error verdadero
%vreal es la raiz verdadera
% imax es el numero maximo de iteraciones

pkg load symbolic
syms x

  fa = function_handle(f);
  df_sym = diff(f,1);
  dfa = function_handle(df_sym);

for i=1:imax %criterio de convergencia, iteraciones maximas
  xR = x0 - (fa(x0)/dfa(x0));
    error_relat_vreal = abs ( (xR - vreal)/vreal)
  %chequear criterios de convergencia
if error_relat_vreal < tolv
    disp(['El metodo converge, la raiz es ',num2str(xR)])
    disp(['Se realizaron ',num2str(i),' iteraciones'])

    break
  endif

  x0= xR;
endfor

endfunction
