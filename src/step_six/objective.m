function f = objective(x, A, B)
    i = 1;
    for elem=1:2:length(x) 
        X(i, :) = [x(elem), x(elem+1)];
        i = i+1;
    end
    M = [A; X; B];
    n = 0;
    
    for elem=1:length(M) - 1
        n = n + norm(M(elem, :) - M(elem+1, :));
    end
    
    f = n;
    %f = -f; not needed, here we want to minimize
end
