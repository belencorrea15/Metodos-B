function Jd = J_disc (f1,f2,X0)

%f1, f2 son funciones simbolicas

  f1_an = function_handle(f1);
  f2_an = function_handle(f2);
  x = X0(1);
  y = X0(2);
  hx = max(0.1*abs(x), 1e-5);
  hy = max(0.1*abs(y), 1e-5);


  Jd(1,1) = (f1_an(x+hx,y) - f1_an(x,y))/hx;
  Jd(1,2) = ((f1_an(x,y+hy)) - f1_an(x,y))/hy;
  Jd(2,1) = (f2_an(x+hx,y) - f2_an(x,y))/hx;
  Jd(2,2) = (f2_an(x,y+hy) - f2_an(x,y))/hy;

endfunction
