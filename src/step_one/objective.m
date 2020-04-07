function f = objective(x, A, B)
    f = norm(A-x) + norm(x-B);
    %f = -f; not needed, here we want to minimize
end
