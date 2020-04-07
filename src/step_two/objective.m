function f = objective(x, A, B)
    x1 = [x(1), x(2)];
    x2 = [x(3), x(4)];
    f = norm(A - x1) + norm(x1 - x2) + norm(x2 - B);
    %f = -f; not needed, here we want to minimize
end
