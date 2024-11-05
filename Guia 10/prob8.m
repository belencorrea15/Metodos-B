% problema 8

clc
clear all
close

r = 0.1 % velocidad incremento de presas
a = 0.01 % velocidad de caza
b = 0.001 % velocidad de reproduccion de predadores por presa comdida
m = 0.05 % mortalidad de cazadores

F1= @(t, P, C) r*P-a*P*C; %Presas
F2= @(t, P, C) b*P*C - m*C %Cazadores

C_0= 15
P_0= 50

a1 = 0 % t=0
b1 = 200 % t=200
h1 = 1
h2 = 0.01

[t_e,p_e,c_e]=Sist_EDO_Euler(F1,F2,P_0,C_0,a1,b1,h1);
[t_e_2,p_e_2,c_e_2]=Sist_EDO_Euler(F1,F2,P_0,C_0,a1,b1,h2);

hold on
plot(t_e,p_e)
plot(t_e,c_e)
plot(t_e_2,p_e_2)
plot(t_e_2,c_e_2)
legend('Presas h=1','Cazadores h=1','Presas h=0.01','Cazadores h=0.01','Presas RKF','Cazadores RKF')
hold off

% Si aumentan las presas, aumentan los depredadores
% Pero en algun momento, disminuyen las presas y por lo tanto
% Los depredadores, y así

% inciso c

% y(1) representa P (presas)
% y(2) representa C (cazadores)

% Definir el sistema de ecuaciones diferenciales
% como una función anónima
F = @(x,y) [r*y(1)-a*y(1)*y(2) ; b*y(1)*y(2) - m*y(2)];
% Vector de condiciones iniciales
Y0 = [P_0,C_0];
int_tiempo= [0 200];
[t_s,y_s]= ode45(F,int_tiempo,Y0);


hold on
plot(t_e,p_e)
plot(t_e,c_e)
plot(t_e_2,p_e_2)
plot(t_e_2,c_e_2)
plot(t_s,y_s(:,1))
plot(t_s,y_s(:,2))
legend('Presas h=1','Cazadores h=1','Presas h=0.01','Cazadores h=0.01','Presas RKF','Cazadores RKF')
hold off



