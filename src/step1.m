clear all;
close all;
pkg load optim;
pkg load image;

% Initial Situation

A = [1 9];
B = [8 2];
P = [8 8];

figure(1);
center = [5 5];
radius = 1;
xlim([0, 10]);
ylim([0, 10]);
grid on
axis square;

viscircles(center, radius, 'Color', 'r');
hold on
plot(A(1), A(2), 'x', 'Color', 'b');
plot(B(1), B(2), 'x', 'Color', 'b');
plot(P(1), P(2), 'o', 'Color', 'r');
plot([A(1) P(1)], [A(2) P(2)], 'Color', 'b', 'LineWidth', 1.5);
plot([P(1) B(1)], [P(2) B(2)], 'Color', 'b', 'LineWidth', 1.5);

% Optimisation Process

Lb = [0; 0];
Ub = [10; 10];
x0 = P;

options = optimset('Display', 'iter', 'TolX', 1*exp(-6), 'TolFun', 1*exp(-6), 'MaxIter', 100, 'MaxFunEvals', 300);
f = fmincon(@objective_min, x0, [], [], [], [], Lb, Ub, @constraints, options);


% Functions

function f = objective_max(x, A, B) 
    f = norm(A-x) + norm(x-B);
    f = -f;
end

function f = objective_min(x, A, B)
    f = norm(A-x) + norm(x-B);
end

function [g h] = constraints(x, A, B, center, radius)
    M = [A ; x ; B]; % Segments matrix
    n = 0:0.01:1; % Discretize
    for i=1:length(M)-1 % for all segments
        for j=1:length(n) % for all points discretize on those segments
            Xi = M(i,:) + n(j)*(M(i+1,:)-M(i,:));
            dist(j,1) = norm(Xi-center);
        end
        g(i)=radius-min(dist(:,1));
    end

    h=[];
end



