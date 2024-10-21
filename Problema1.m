 % Maria Belen Correa

 clc
 clear all
 close all

 A = [1,3;4,7];
 b = [3;4];

 rta_inciso_b= A*b;

 disp(num2str(rta_inciso_b))

% disp(num2str(x)) es manera de convertir números a texto
% y mostrarlos en la consola en Octave.

%num2str(x): Convierte un número (o un array de números) en una cadena de caracteres.
% disp(s): Muestra una cadena de caracteres, un número o una matriz en la consola.

%PREGUNTAR BIEN LAS DIFERENCIAS

%inciso e
rank_A=rank(A);
tamano_A = size(A,1);

if rank_A == tamano_A
  disp('La matriz no es singular')
else
  disp('La matriz es singular')
endif

% para resolver el sistema Ax=b se usa el operador \

rta_inciso_f = A\b;

disp(rta_inciso_f)

%inciso d

g1 = A*transpose(A)
g2 = inv(A)
g3 = A^2
