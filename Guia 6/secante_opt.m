function xR = secante_opt (fprim, x0,x_menos1,tol,imax)
% Busca un optimo (maximo o minimo) usando el metodo de la secante
% fprima, primera derivada de f, funcion anonima
% x0 =  Valor incial para el metodo de NR x0_menos1
% tol = Tolerancia del metodo de NR

for i=1:imax %criterio de convergencia, iteraciones maximas

  xR = x0 - (fprim(x0)*((x0)-(x_menos1))/(fprim(x0)-fprim(x_menos1)));
  error_ant = abs( xR - x0 )/ abs(xR+1*10^-10);

  %chequear criterios de convergencia
if error_ant < tol
    disp(['El metodo converge, la raiz es ',num2str(xR)])
    disp(['Se realizaron ',num2str(i),' iteraciones'])
    break
  endif

  x_menos1 = x0;
  x0= xR;

endfor

endfunction
