clear all; close all;

x1 = 4;
x2 = 6;
y1 = 0;
y2 = 4;
x = [x1, x2, x2, x1, x1];
y = [y1, y1, y2, y2, y1];
y_2 = [10, 10, 6, 6, 10];

plot(x, y, 'b-', 'LineWidth', 3);
hold on
plot(x, y_2, 'b-', 'LineWidth', 3);
xlim([0, 10]);
ylim([0, 10]);

A = [1 9];
B = [8 2];
P = [8 8];
plot(A(1), A(2), 'x', 'Color', 'b');
plot(B(1), B(2), 'x', 'Color', 'b');
plot(P(1), P(2), 'o', 'Color', 'r');
plot([A(1) P(1)], [A(2) P(2)], 'Color', 'b', 'LineWidth', 1.5);
plot([P(1) B(1)], [P(2) B(2)], 'Color', 'b', 'LineWidth', 1.5);

text(A(1), A(2), '  A');
text(B(1), B(2), '  B');
text(P(1), P(2), '  P1');

center = [3 3];
radius = 1;
viscircles(center, radius, 'Color', 'r');