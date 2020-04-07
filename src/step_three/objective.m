function f = objective(x, A, B)
    x1 = [x(1), x(2)];
    x2 = [x(3), x(4)];
    x3 = [x(5), x(6)];
    x4 = [x(7), x(8)];
    x5 = [x(9), x(10)];
    n1 = norm(A - x1);
    n2 = norm(x1 - x2);
    n3 = norm(x2 - x3);
    n4 = norm(x3 - x4);
    n5 = norm(x4 - x5);
    n6 = norm(x5 - B);
    f = n1 + n2 + n3 + n4 + n5 + n6
    %f = -f; not needed, here we want to minimize
end
