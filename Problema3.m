 % Maria Belen Correa

 clc
 clear all
 close all

 t=[0:2:20];
 elementos_t = length(t);
 disp(['El vector tiene ',num2str(elementos_t),' elementos'])

 g=9.81;
 m=68.1;
 cd=0.25;

 v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);

 plot(t,v);

 title('t vs v');
 xlabel('tiempo');
 ylabel('velocidad');
 grid;


