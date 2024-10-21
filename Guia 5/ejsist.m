% ejemplo sist ecuaciones lineales

% f y x es vector columna

clc
clear all
close

pkg load symbolic
syms x y

f1 = x.^2  + y.^2 - 1

f2 = x-y

%hold on
%ezplot(f1,[-2 2 -2 2])
%ezplot(f2,[-2 2 -2 2])
%hold off
%xlabel("x","fontsize",20)
%ylabel("y","fontsize",20)
%grid on
%box on

Fsym= [f1;f2]
Fan= function_handle(Fsym)

F = @(X) Fan (X(1),X(2))

X0 = [1;2];
F(X0);

Jsym = jacobian(Fsym);
Jan = function_handle(Jsym);

%hay que vectorizar
% recibe solo puntos, no vector

J = @(X) Jan(X(1),X(2));
J(X0);

imax=20;
tolf=10^-6;
X0 = [1;2];

for i=1:imax

  P = inverse(J(X0)) * (-F(X0));
  XR = X0 + P;
  er = norm(F(XR),2);

  if er < tolf
    disp(['convergencia'])
    XR
    i
    break
  endif

  X0 = XR;
endfor

XR_fsolve = fsolve(F,X0)




