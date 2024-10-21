
function xR = newton_opt (fprim, fprim2,x0, tol, imax)
% Busca un optimo (maximo o minimo) usando el metodo de Newton
% fprima, primera derivada de f, funcion anonima
% fprimasegunda, segunda derivada de f, funcion anonima
% x0 =  Valor incial para el metodo de NR
% tol = Tolreancia del metodo de NR

for i=1:imax %criterio de convergencia, iteraciones maximas
  xR = x0 - (fprim(x0)/fprim2(x0));
  error_ant = abs( xR - x0 )/ abs(xR+1*10^-10);

  %chequear criterios de convergencia
if error_ant < tol
    disp(['El metodo converge, la raiz es ',num2str(xR)])
    disp(['Se realizaron ',num2str(i),' iteraciones'])
    break
  endif

  x0= xR;
endfor

%ver si es un maximo o minimo

if fprim2(xR) > 0
  disp('Se trata de un minimo')
elseif fprim2(xR) < 0
  disp('Se trata de un maximo')
else
  disp('No puedo asegurar nada')
endif

endfunction
