

function fa = prueba (f,x0)

pkg load symbolic
syms x

fs= f
difs = diff(f,2)
fa= function_handle(f)
faa = fa(x0)

endfunction
