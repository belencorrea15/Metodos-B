function xopt_d = seccion_dorada (f,xL,xu,dmax,imax)

% busca maximos
% Algoritmo de búsqueda de máximos con el método de la Sección Dorada
% xl y xu tienen que encerrar el max local

R = 0.61803
d = (xu-xL)*R;

x1 = xL+d;
x2 = xu-d;
f1= f(x1);
f2= f(x2);

for i=1:imax

if f1 > f2
  d = x2 - xL;
  xL = x2;
  x2 = x1;
  x1 = xL + d;
  f2 = f1;
  f1 = f(x1);
else
  d = xu-x1;
  xu = x1;
  x1 = x2;
  x2 = xu - d;
  f1 = f2;
  f2 = f(x2);
endif

if f1>f2
  xopt_d=x1
  fx=f1
else
  xopt_d=x2
  fx=f2
  endif

if d <= dmax
  disp(['Se alcanzó la convergencia, se realizaron ',num2str(i),' iteraciones'])
  break
endif

endfor
disp(xopt_d)
endfunction
