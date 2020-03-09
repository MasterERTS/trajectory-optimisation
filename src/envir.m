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
