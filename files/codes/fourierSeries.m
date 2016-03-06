function [ a0, an, bn ] = fourierSeries( fun, indepvar, T, indexvar )
% [an, bn] = fourierSeries(SYMFUN, FUNVAR, period, index)
% This function receives a symbolic function SYMFUN, its independent
% variable FUNVAR (assumed t if not specified), the initial and final points
% of the fundamental period as period = [t0, t1] and
% the symbolic variable for its fourier index. The summation index for the
% fourier series is assumed n if not specified
%
%  [an, bn] = fourierSeries(SYMFUN, period)
%  [an, bn] = fourierSeries(SYMFUN, var, period)
%  [an, bn] = fourierSeries(SYMFUN, var, period, indexvar)
%
%  i.e. If fun is function of t with summation index n:
%  fun = a0 + sum( an*cos(n*w*) + bn*sin(n*w*t) );
syms t n;

if nargin < 2
    disp('Insufficient number of arguments.');
elseif nargin == 2
    T = indepvar;
    indepvar = t;
    indexvar = n;
elseif nargin == 3
    indexvar = n;
end

w = 2*pi/(T(2) - T(1));

a0 = int(fun,indepvar,T(1),T(2))/(T(2) - T(1));
an = (2/(T(2) - T(1))) * int(fun*cos(indexvar*w*indepvar),indepvar,T(1),T(2));
bn = (2/(T(2) - T(1))) * int(fun*sin(indexvar*w*indepvar),indepvar,T(1),T(2));

end
