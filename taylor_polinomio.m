
function taya = taylor_polinomio (f,x0,n)

%f es la funcion simbolica
%x0 es el punto de base
%n es el orden del polinomio

pkg load symbolic
syms x
warning('off', 'OctSymPy:sym:rationalapprox')

fa= function_handle(f);
tay = fa(x0);

for i=1:n
  df = diff(f,i);
  dfa = function_handle(df);

  tay = tay + dfa(x0)*(x-x0)^i/factorial(i);
endfor

taya = function_handle(tay);

endfunction
