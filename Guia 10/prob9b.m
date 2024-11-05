% problema 9
% inciso b

pkg load symbolic
syms x(t) z(t)

% Ecuaciones diferenciales
eq1 = diff(x, t) == -2*z - 10*x;
eq2 = diff(z, t) == z;

x0 = 10;
z0 = 0;


S = dsolve([eq1 , eq2], x(0) == x0 , z(0) == z0)


