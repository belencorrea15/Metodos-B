% problema 1

clc
clear all
close

 f1 = @(x,y,z) z;
 f2 = @(x,y,z) 2.*z-y-3;

 Y = @(x) -3 + (2.*exp(x).*x / exp(2));

 a=0;
 b=2;
 h=0.5;
 y_a= -3;
 y_b= 1;

 % primer disparo Euler
 z_a1 = 1; % suposicion
 [x_e,y_e,z_e] = Sist_EDO_Euler(f1,f2,y_a,z_a1,a,b,h);
 % segundo disparo Euler
 y_b1 = y_e(5);
 z_a2 = 0.8;
 [x_e,y_e,z_e] = Sist_EDO_Euler(f1,f2,y_a,z_a2,a,b,h);
 y_b2 = y_e(5);
 %interpolacion
 z_a3 = (z_a2-z_a1)/(y_b2-y_b1)*(y_b-y_b1)+z_a1;
 % tercer disparo
 [x_e,y_e,z_e] = Sist_EDO_Euler(f1,f2,y_a,z_a3,a,b,h);
 % es exacto

 % AHORA METODO RK4
 % primer disparo
 [x_rk4,y_rk4,z_rk4] = Sist_EDO_RK4(f1,f2,y_a,z_a1,a,b,h);
 y_b1_rk4 = y_rk4(end);
 % segundo disparo
 [x_rk4,y_rk4,z_rk4] = Sist_EDO_RK4(f1,f2,y_a,z_a2,a,b,h);
 y_b2_rk4 = y_rk4(end);
 %interpolacion
 z_a3_rk4 = (z_a2-z_a1)/(y_b2_rk4-y_b1_rk4)*(y_b-y_b1_rk4)+z_a1;
 % tercer disparo
 [x_rk4,y_rk4,z_rk4] = Sist_EDO_RK4(f1,f2,y_a,z_a3_rk4,a,b,h);
 % es exacto

 %AHORA METODO PM
 [x_pm,y_pm,z_pm] = Sist_EDO_PM(f1,f2,y_a,z_a1,a,b,h);
 y_b1_pm = y_pm(end);
 % segundo disparo
 [x_pm,y_pm,z_pm] = Sist_EDO_PM(f1,f2,y_a,z_a2,a,b,h);
 y_b2_pm = y_pm(end);
 %interpolacion
 z_a3_pm = (z_a2-z_a1)/(y_b2_pm-y_b1_pm)*(y_b-y_b1_pm)+z_a1;
 % tercer disparo
 [x_pm,y_pm,z_pm] = Sist_EDO_PM(f1,f2,y_a,z_a3_pm,a,b,h);
 % es exacto

 %AHORA METODO Heun
 [x_h,y_h,z_h] = Sist_EDO_Heun(f1,f2,y_a,z_a1,a,b,h);
 y_b1_h = y_h(end);
 % segundo disparo
 [x_h,y_h,z_h] = Sist_EDO_Heun(f1,f2,y_a,z_a2,a,b,h);
 y_b2_h = y_h(end);
 %interpolacion
 z_a3_h = (z_a2-z_a1)/(y_b2_h-y_b1_h)*(y_b-y_b1_h)+z_a1;
 % tercer disparo
 [x_h,y_h,z_h] = Sist_EDO_Heun(f1,f2,y_a,z_a3_h,a,b,h);
 % es exacto

 % ahora con diferencias finitas

 x = [a:h:b]
 n = length(x);
 y0(1:n) = 2; %estimacion inicial

 y_dif = fsolve(@Func_1,y0);

 hold on
 plot(x_e,y_e)
 plot(x_rk4,y_rk4)
 plot(x_pm,y_pm)
 plot(x_h,y_h)
 plot(x,y_dif)
 fplot(Y,[0,2])
 legend('Euler','Punto Medio','RK4','Heun','Dif. finitas','Analitico')
 hold off




