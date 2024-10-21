## Copyright (C) 2024 beluu
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} Jac_disct (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: beluu <beluu@BELENCORREA1512>
## Created: 2024-09-20

function J = Jac_disct (f1,f2,X0,a,b)

  f1 = function_handle(f1);
  f2 = function_handle(f2);
  x0 = X0(1);
  y0 = X0(2);
  hx = max(a*abs(x0), b);
  hy = max(a*abs(y0), b);

  J(1,1) = (f1(x0+hx,y0) - f1(x0,y0))/hx;
  J(1,2) = ((f1(x0,y0+hy)) - f1(x0,y0))/hy;
  J(2,1) = (f2(x0+hx,y0) - f2(x0,y0))/hx;
  J(2,2) = (f2(x0,y0+hy) - f2(x0,y0))/hy;

endfunction
