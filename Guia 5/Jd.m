function J = Jd(X0)

  f1 = @(x,y) x^2+y^2-1;
  f2 = @(x,y) x-y;
  x = X0(1);
  y = X0(2);
  hx = max(0.1*abs(x), 1e-5);
  hy = max(0.1*abs(y), 1e-5);

  J(1,1) = (f1(x+hx,y) - f1(x,y))/hx;
  J(1,2) = (f1(x,y+hy) - f1(x,y))/hy;
  J(2,1) = (f2(x+hx,y) - f2(x,y))/hx;
  J(2,2) = (f2(x,y+hy) - f2(x,y))/hy;

endfunction
