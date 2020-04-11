function [g h] = constraints(x, A, B, Cs, radius)
    array_n = 1;
    for elem = 1:2:length(x)
        X(array_n, :) = [x(elem), x(elem+1)];
        array_n = array_n + 1;
    end  
    M = [A ; X ; B];
    
    for elem = 1:2:length(Cs)
        centers(elem, :) = [Cs(elem), Cs(elem+1)];
    end
    p = 0;
    n = 0:0.001:1; % Discretize
    for k = 1:length(centers)
        for i=1:length(M)-1 % for all segments
            for j=1:length(n) % for all points discretize on those segments
                Xi = M(i,:) + n(j)*(M(i+1,:) - M(i,:));
                dist(j,1) = norm(Xi - centers(k, :));
                
            end
            p = p+1;
            g(p) = radius - min(dist(:,1));
        end
    end
 

    h=[];
end

