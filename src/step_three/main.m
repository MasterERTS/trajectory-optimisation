%%%% ONE CIRCLE, FIVE REFERENCE POINT %%%%

clear all;
close all;

% Initial Situation

A = [1 9];
B = [8 2];

P = [8 8];
P2 = [2 6];
P3 = [3 8];
P4 = [5 9];
P5 = [8 4];

Ps = [P, P2, P3, P4, P5];

center = [5 5];
radius = 1;


figure(1);
xlim([0, 10]);
ylim([0, 10]);
grid on
axis square;

viscircles(center, radius, 'Color', 'r', 'LineWidth', 1);
hold on
plot(A(1), A(2), 'x', 'Color', 'b');
plot(B(1), B(2), 'x', 'Color', 'b');
for iter=1:2:length(Ps)
    % Create temporary variable due to arrays not beinge reindexable
    tempPs = [Ps(iter), Ps(iter+1)];
    plot(tempPs(1), tempPs(2), 'o', 'Color', 'r');
end

lines = [A, P, P2, P3, P4, P5, B];

for iter=1:2:(length(lines)-2)
    tempA = [lines(iter), lines(iter+1)];
    tempB = [lines(iter+2), lines(iter+3)];
    plot([tempA(1), tempB(1)], [tempA(2), tempB(2)], '--', 'Color', 'b', 'LineWidth', 1.5);
end

% Optimisation Process

Lb = [0, 0];
Ub = [10, 10];
x0 = [P, P2, P3, P4, P5];

obj = @(x)objective(x, A, B);
cons = @(x)constraints(x, A, B, center, radius);


options = optimset('Display', 'iter', 'TolX', 1*exp(-6), 'TolFun', 1*exp(-6), 'MaxIter', 100, 'MaxFunEvals', 300);
x = fmincon(obj, x0, [], [], [], [], Lb, Ub, cons, options);

for iter=1:2:length(x)
    % Create temporary variable due to arrays not beinge reindexable
    tempX = [x(iter), x(iter+1)];
    plot(tempX(1), tempX(2), 'o', 'Color', 'g');
end

plot([A(1), x(1)],[A(2), x(2)],'r');
plot([x(1), x(3)], [x(2), x(4)], 'r');
plot([x(3), x(5)], [x(4), x(6)],'r');
plot([x(5), x(7)], [x(6), x(8)],'r');
plot([x(7), x(9)], [x(8), x(10)],'r');
plot([x(9), B(1)], [x(10), B(2)],'r');



