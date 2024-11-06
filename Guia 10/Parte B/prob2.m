% problema 2

clc
clear all
close

 % x es r, u es y
 f1 = @(x,y,z) z;
 f2 = @(x,y,z) -2/x .* z;

 Y = @(x) -110 + (440 ./ x);

 a=2;
 b=4;
 h=0.2;
 y_a= 110;
 y_b= 0;

 %disparo 1
  z_a1 = -100
 [x_rk4,y_rk4,z_rk4] = Sist_EDO_RK4(f1,f2,y_a,z_a1,a,b,h);
 y_b1 = y_rk4(end)

 %disparo 2
  z_a2 = -110
  [x_rk4,y_rk4,z_rk4] = Sist_EDO_RK4(f1,f2,y_a,z_a2,a,b,h)
  y_b2 = y_rk4(end)

  Error = y_b-y_b2 % El error es chico entonces no se necesita otro disparo
  % aproximacion para x=3
  disp(['La aproximacion con RK4 para x=3 es y= ',num2str(y_rk4(6))])
  disp(['El valor real para x=3 es y= ',num2str(Y(3))])

  %Ahora con diferencias finitas
   x = [a:h:b];
   n = length(x);
   y0(1:n) = 0.01; %estimacion inicial

   y_dif = fsolve(@func_2,y0);

  hold on
  plot(x_rk4,y_rk4,'o')
  plot(x,y_dif,'o')
  fplot(Y,[2 4])
  legend('Aprox RK4','Dif. finitas','Solucion analitica')
  hold off



