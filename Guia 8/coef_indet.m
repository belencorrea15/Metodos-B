
function P_ci = coef_indet(xdat, ydat)

pkg load symbolic
syms x
warning('off', 'all')

% xdat : vector con los puntos de la variable independiente
% ydat : vector con los puntos de la variable dependiente (f(x))

n = length(xdat); % cantidad de datos
A = zeros(n); % matriz del sistema de ecuaciones

% Construir la matriz A del sistema
for i=1:n   % Recorre cada fila, que corresponde a un punto x(i)
  for j=1:n % Recorre cada columna, que corresponde a las potencias de x(i)
    A(i, j) = xdat(i)^(j-1);
  endfor
endfor

b = transpose(ydat);
coefs = A\b;

%ahora tengo que armar el polinomio usando esos coefs

P_ci_sym =0;

for i=1:length(coefs)

  P_ci_sym = P_ci_sym + coefs(i)*x^(i-1);
endfor

P_ci_sym = simplify(P_ci_sym);

P_ci =function_handle(P_ci_sym);

endfunction
