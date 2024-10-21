 % Maria Belen Correa

 clc
 clear all
 close all

 x = [-2,0,2];

 % c) Genere un vector y que sea el triple del vector x.

 y = 3 * x;

 % d) Genere un vector z que sea la mitad del vector x.

 z = x/2;

 % inciso e

 v = x+y+z
 w = x - (1/3*y)

 %e.3) t = y*z (producto interno o producto escalar de vectores, t=y*z')

 t = y*z'

%el operador ' se usa para transponer una matriz o un vector.
%usandolo en vectores,' convierte un vector fila en un vector columna

%e.4) Determine un vector q cuyos elementos sean el resultado de multiplicar
% cada elemento de y por el correspondiente de z.(producto elemento a
%elemento, q=y.*z)

 q = z .* y

 % sin el punto, es multipicacion matricial y en este caso no se puede

 r = y .^2
