function [fval] = Fsolve_3 (XR)

% este archivo funcion evalua el sistema de ecuaciones no lineales
% en el vector XR y devuelve los valores en el vector fval

% tomar valores de XR

 x = XR(1) ;
 y = XR(2) ;

% evaluar el sistema en el punto

fval(1,1) = (x-1)^2 + (y-1)^2 - 1 ;
fval (2,1) = x - y ;
endfunction
