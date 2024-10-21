
%Entradas:
% _ el archivo (f), que debe devolver el vector fval de las funciones
%   evaluadas en el punto
% _ el archivo (jac) que debe devolver la matriz jac del jacobiano evaluado
%   en el punto
% _ el vector de estimaciones iniciales X0
% _ la tolerancia de cuánto se acerca a 0 la función (tolf)
% _ la tolerancia de cuán cerca están dos estimaciones sucesivas (tolit)
% _ el número máximo de iteraciones permitido (maxit)
%Salidas:
% _ vector con los valores estimados de la raíz (XR)

function [XR] = MetNR_multiv (f,jac,X0,tolf,tolit,maxit)

% determinar si X0 es vector columna o fila
nvart = size(X0) ; % Se asigna a la variable nvart un vector X0
if nvart(1) == 1 %Condicional para saber si el valor del primer elemento
  %del nvart es 1
    % X0 es vector fila, hacer transposición
    X0 = X0' ; % hacer la transpuesta

else
    % X0 es vector columna, no hacer cambios
endif

% aplicar las iteraciones del método
XOLD = X0 ; Se guarda el valor de la iteracion

for i=1:maxit

    disp(['Iteración: ',num2str(i),'--']) ;

    % obtener nueva estimación
    [fval] = f(XOLD) ;                          % evalúa función
    [jval] = jac(XOLD) ;                        % evalúa jacobiano

    % cualquiera de los siguientes métodos se pueden utilizar en MATLAB
    % para resolver la iteración
    % eliminar o comentar los que no se vayan a usar
%     % con el solver de sistemas lineales
%     p = linsolve(jval,-fval) ;
%     XR = XOLD + p ;
%     % con el comando "\" (abreviatura de mldivide)
%     p = jval\(-fval) ;
%     XR = XOLD + p ;
    % con el comando de inversa de matrices
    XR = XOLD - inv(jval)*fval ; %Multiplico ambos lados con la inversa del jac
    p = XR - XOLD ; % obtengo el valor del paso

    disp(['Estimación de la raíz: ']) ;
    disp(num2str(XR)) ;  %muestro el valor de la raiz calculada

    % controlar la convergencia por medio de la norma 2 de la función y de
    % la diferencia relativa entre dos aproximaciones sucesivas
   % eaf = norm(fval,2) ;
    %disp(['Convergencia (función): ',num2str(eaf)]) ;
   % if ((eaf <= tolf))
    %  disp(['se encontró la raíz con la toleracia pedida.']) ;
     % break;
  % end

  %uso el criterio de convergencia de la norma de dos pasos simultaneos

  error_val_aprox = norm(XR_B - X0,2);
  if error_val_aprox < tolit
    disp(['se encontró la raíz con la toleracia pedida.']) ;
     break;
  endif

    XOLD = XR ; % actualizo el valor viejo

end

% controlar si se salió del lazo porque se encontró la raíz o se llegó al
% máximo de iteraciones
if i==maxit
    disp(['********** N° máximo de iteraciones alcanzado! **********'])
end

endfunction
