function output = computeFourierSeries(a0, an, bn, w, indepvar, iter, step)
%This funcion calculates an approximation of fun, given its Fourier Series where:
%   output = plotFourierSeries(a0, an, bn, w, indepvar, itervar, iter, step);
%
%   output = a0 + summation( an*cos(n*w*indepvar) + bn*cos(n*w*indepvar) );
% 
    output = a0;
    for n=1:step:iter
        output = output + subs(an*cos(n*w*indepvar) + bn*sin(n*w*indepvar),n);
    end
end