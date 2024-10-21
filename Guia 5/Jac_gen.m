function J_D = Jac_gen (F,X0)
% F es un funcion anonima de @(X) vectorizado
% X0 el valor inicial como vector columna

n=length(X0);
J=zeros(n,n); %matriz generica de ceros
F_X0=F(X0);


%El bucle externo recorre cada fila i de la matriz Jacobiana
%el bucle interno recorre cada columna j.
for i=1:n
    for j=1:n
       delta=zeros(n,1);
%se establece un valor de perturbación para cada variable j.
       delta(j) = max(0.001.*abs(X0(j)),1.0e-5);
%Esto se hace para asegurar que la perturbación sea suficientemente pequeña y no provoque un error numérico.
       Fd = F(X0+delta); %se evalúa F en el punto perturbado
       J_D(i,j)= ((Fd(i)-F_X0(i))/delta(j));
    endfor
endfor

endfunction

% Fd es el resultado de evaluar la función F en un punto perturbado,
% X0+delta. Esto significa que has cambiado solo la j-ésima variable de X0
​% al agregar la perturbación delta(j).

%F_X0 es el resultado de evaluar la función F en el punto original X0
%Fd(i) es la i-ésima componente de la función evaluada en el punto perturbado.
%F_XO(i) es la i-ésima componente de la función evaluada en el punto original.
%Fd(i) - F_XO(i) representa el cambio en la i-ésima componente de la función
%cuando se realiza una perturbación en la j-ésima variable.
