%problema 3

% inciso a

X0a= [1 ; 1];
XR_solve_a = fsolve(@Fsolve_3,X0a)

% inciso b

X0b = [ 1 ; 1 ];
func_solve = @(X)[ (X(1)-1)^2 + (X(2)-1)^2 - 1 ; X(1)-X(2) ] ;

XR_solve_b = fsolve(func_solve,X0b)
