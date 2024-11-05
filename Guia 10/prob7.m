% problema 7

clc
clear
close

f1 = @(x,y,T)  -0.1744*exp(3.21/T)*y
f2 = @(x,y,T)  0.06984*exp(3.21/T)*y

a=0;
b=1;
h=(b-a)/100;
y0=1
T0 = 1;

[x_e,y_e,T_e]= Sist_EDO_Euler(f1,f2,y0,T0,a,b,h);

hold on
plot(x_e,y_e)
plot(x_e,T_e)
legend('Perfil de concentracion', 'Perfil de temperatura')
hold off

# La zona efectiva de la reaccion es buena, disminuye en todo x

# Como los valores de T* no varían demasiado, podemos decir que el comp del
# reactor se asemeja a un comp isotérmico, se ve graficamente que si bien hay
# una variacion en el valor de T* no es muy pronunciada.

[x_RK4,y_RK4,T_RK4]= Sist_EDO_RK4(f1,f2,y0,T0,a,b,h);

figure 2
plot(x_RK4,y_RK4)
