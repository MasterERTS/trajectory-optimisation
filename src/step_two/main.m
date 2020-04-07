%%%% ONE CIRCLE, TWO REFERENCE POINTS %%%%

clear all;
close all;

% Initial Situation

A = [1 9];
B = [8 2];
P = [8 8];
P2 = [8 6];

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
plot(P(1), P(2), 'o', 'Color', 'r');
plot(P2(1), P2(2), 'o', 'Color', 'r');
plot([A(1) P(1)], [A(2) P(2)], 'Color', 'b', 'LineWidth', 1.5);
plot([P(1) P2(1)], [P(2) P2(2)], 'Color', 'b', 'LineWidth', 1.5);
plot([P2(1) B(1)], [P2(2) B(2)], 'Color', 'b', 'LineWidth', 1.5);

% Optimisation Process

Lb = [0, 0];
Ub = [10, 10];
x0 = [P P2];

obj = @(x)objective(x, A, B);
cons = @(x)constraints(x, A, B, center, radius);


options = optimset('Display', 'iter', 'TolX', 1*exp(-6), 'TolFun', 1*exp(-6), 'MaxIter', 100, 'MaxFunEvals', 300);
x = fmincon(obj, x0, [], [], [], [], Lb, Ub, cons, options);

plot(x(1), x(2), 'o', 'Color', 'g');
plot(x(3), x(4), 'o', 'Color', 'g');
plot([A(1) x(1)],[A(2) x(2)],'r');
plot([x(1), x(3)], [x(2), x(4)], 'r');
plot([x(3) B(1)],[x(4) B(2)],'r');



