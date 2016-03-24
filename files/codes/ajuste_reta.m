fprintf('Carregando dados\n');
clear all;
%% SETUP
data = load('reta.txt');
x = data(:, 1);
y = data(:, 2);

close all;
plot(x,y,'rx');
title('Ajuste de Minimos Quadrados');

n = 1;
X = bsxfun(@power,x,0:n);
%% EQ NORMAL
%X = [ones(size(x)) x];
tic;
theta = (X'*X)\(X'*y);
toc;
disp('Eq Normal')
disp(theta)
hold on;
plot(x,X*theta,'g-');
hold off;
%% GRADIENT DESCENT
m = length(y);
maxiter = 10000;
cost = zeros(maxiter,1);
alpha = 0.001;
theta = rand(n+1,1);
limiar = 1e-7;
tic;
for iter=1:maxiter
    theta = theta - (alpha/m * (X')*(X*theta - y));
    cost(iter) = sum((X*theta - y).^2)/(2*m);
    if  (iter > 1) && (abs(cost(iter) - cost(iter-1)) < limiar)
        break
    end
end
toc;

disp('Gradiente')
disp(theta)
hold on;
plot(x,X*theta,'b.')
hold off;
