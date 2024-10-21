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
## @deftypefn {} {@var{retval} =} chop (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: beluu <beluu@BELENCORREA1512>
## Created: 2024-07-26

function X = chop (Xin, n)

## CHOP(X,n) redondea los elementos X con n cifras significativas

X = abs(Xin) +(Xin==0);
[nx,mx] = size(X);
exponent = 1.*((10*ones(nx,mx)).^(floor(log10(X))-n+1));
X = round(X./exponent).*exponent;
X = sign(Xin).*X.*(Xin~=0);

endfunction
