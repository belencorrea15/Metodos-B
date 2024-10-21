 % Maria Belen Correa
 % Problema 4
 clc
 clear all
 close all

 % primero desde n=1 hasta n=10000
 suma1 = 0;
 n = 10000;

 % for variable = inicio:incremento:fin
 for i=1:1:n

   suma1 = chop(suma1 + 1/i^2,3);
endfor

disp(suma1)

% ahora desde n=10000 hasta n=1

suma2 = 0;

for i=n:-1:1

   suma2 = chop(suma2 + 1/i^2,3);

 endfor

 disp(suma2)


%si	el	 término	 inicial	 de	 una	 serie	 es	 relativamente	 grande
%en	 comparación	 con	 los	demás	términos,	después	de	que	se	han
%sumado	unos	pocos	términos,	estamos	en	la
%situación	de	sumar	una	cantidad	pequeña	a	una	cantidad	grande.

% Al sumar una cantidad pequeña a una cantidad grande (utilizando 3 cifras
%significativas) es como no sumarle nada.

