%ejemplo

clc
clear all
close

pkg load symbolic
syms x y

f1 = x.^2  + y.^2 - 1

f2 = x - y

X0 = [1;2]

tol=0.01
imax=20

XR_fsolve = Newton_Raphson (f1,f2,X0,tol,imax)
