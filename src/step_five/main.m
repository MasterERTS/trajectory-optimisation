%%%% M CIRCLE, N REFERENCE POINT %%%%

clear all;
close all;

% Initial Situation

% Guess Points
A = [1 9];
B = [8 2];

% Reference Points
P = [8 8];
P2 = [2 6];
P3 = [6 8];
P4 = [9 9];

% Array of reference points
Ps = [P, P2, P3, P4];

% Centers
c = [4 7];
c2 = [7 4];
c3 = [5, 3];
radius = 1;

% Array of centers
Cs = [c, c2, c3];

% Plot Grid
figure(1);
xlim([0, 10]);
ylim([0, 10]);
grid on
axis square;

% Plot Guess Points
hold on
plot(A(1), A(2), 'x', 'Color', 'b');
plot(B(1), B(2), 'x', 'Color', 'b');

% Plot Circles
for iter=1:2:length(Cs)
    circle = [Cs(iter), Cs(iter+1)];
    viscircles(circle, radius, 'Color', 'r', 'LineWidth', 1);
end

% Plot Reference Points
for iter=1:2:length(Ps)
    % Create temporary variable due to arrays not beinge reindexable
    tempPs = [Ps(iter), Ps(iter+1)];
    plot(tempPs(1), tempPs(2), 'o', 'Color', 'r');
end

lines = [A, Ps, B];

for iter=1:2:(length(lines)-2)
    tempA = [lines(iter), lines(iter+1)];
    tempB = [lines(iter+2), lines(iter+3)];
    plot([tempA(1), tempB(1)], [tempA(2), tempB(2)], '--', 'Color', 'b', 'LineWidth', 1.5);
end

% Optimisation Process

Lb = [0, 0];
Ub = [10, 10];
x0 = Ps;

obj = @(x)objective(x, A, B);
cons = @(x)constraints(x, A, B, Cs, radius);


options = optimset('Display', 'iter', 'TolX', 1*exp(-6), 'TolFun', 1*exp(-6), 'MaxIter', 100, 'MaxFunEvals', 300);
x = fmincon(obj, x0, [], [], [], [], Lb, Ub, cons, options);

% Plot adjusted reference points X
for iter=1:2:length(x)
    % Create temporary variable due to arrays not beinge reindexable
    tempX = [x(iter), x(iter+1)];
    plot(tempX(1), tempX(2), 'o', 'Color', 'g');
end

% Plot lines
lines = [A, x, B];
for iter=1:2:length(lines)-2
    plot([lines(iter), lines(iter+2)], [lines(iter+1), lines(iter+3)], 'r');
end



