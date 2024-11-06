

function [x,y1,y2] = Sist_EDO_PM (f1,f2,y1_0,y2_0,a,b,h)


x = [a:h:b];
n = length(x);

% Creo el vector y1 e y2
y1 = zeros(1,n);
y2 = zeros(1,n);

% Cargo el valor inicial
y1(1) = y1_0;
y2(1) = y2_0;

for i=2:n

%Usa Euler para calcular la pendiente a mitad del paso
x_p = x(i-1)+h/2;
y1_p = y1(i-1) + (h/2)*f1(x(i-1),y1(i-1),y2(i-1));
y2_p = y2(i-1) + (h/2)*f2(x(i-1),y1(i-1),y2(i-1));
%utiliza la pendiente del punto medio para todo el intervalo
y1(i) = y1(i-1) + h*f1(x_p,y1_p,y2_p);
y2(i) = y2(i-1) + h*f2(x_p,y1_p,y2_p);

endfor
endfunction
