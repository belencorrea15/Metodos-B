clc
clear
close all

pkg load symbolic
syms x y

f1 = x.^2 + y.^2 - 1;
f2 = x - y;

Fs = [f1;f2];
Fa = function_handle(Fs);
F = @(X) Fa(X(1),X(2));

Js = jacobian(Fs);
Ja = function_handle(Js);
J = @(X) Ja(X(1),X(2));

X0 = [0.9;0.9];
Jver = J(X0)

Jdisc = Jac_disct(f1,f2,X0,0.01,1e-4)

N = 15;
tol = 1e-5;
Xold = X0;
disp('--------')
disp('Método de Newton discretizado')
disp('--------')
for i = 1:N
  Jac = Jac_disct(f1,f2,Xold,0.0001,1e-5)
  P = Jac\-F(Xold);
  XR = Xold + P;
  erf = norm(F(XR),2);
  if erf < tol
    disp(['converge para la iteracion ', disp(i)])
    disp(['La solucion es: ', disp(XR)])
    break
  endif
  Xold = XR;
endfor
disp('--------')
disp('Método de Broyden con act de la matriz jacobiana')
disp('--------')
X0 = [0.9;0.9];
Xold = X0;
B = J(X0);
for i = 1:N
  P = B\-F(Xold);
  XR = Xold + P;
  erf = norm(F(XR),2);
  if erf < tol
    disp(['converge para la iteracion ', disp(i)])
    disp(['La solucion es: ', disp(XR)])
    break
  endif
  Y = F(XR) - F(Xold);
  B = B + (Y - B*P)*P'/(P'*P);
  Xold = XR;
endfor
disp('--------')
disp('Método de Broyden con actualizacion de la inversa del jacobiano')
disp('--------')
X0 = [0.9;0.9];
Xold = X0;
H = inverse(J(X0));
for i = 1:N
  P = H*(-F(Xold)); % No es necesario poner \ porque H ya es inversa.
  XR = Xold + P;
  erf = norm(F(XR),2);
  if erf < tol
    disp(['converge para la iteracion ', disp(i)])
    disp(['La solucion es: ', disp(XR)])
    break
  endif
  Y = F(XR) - F(Xold);
  H = H + (P - H*Y)*P'*H/(P'*H*Y);
  Xold = XR;
endfor

