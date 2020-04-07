function [g h] = constraints(x, A, B, center, radius)
    x1 = [x(1), x(2)];
    x2 = [x(3), x(4)];
    M = [A ; x1 ; x2 ; B];
    n = 0:0.001:1; % Discretize
    for i=1:length(M)-1 % for all segments
        for j=1:length(n) % for all points discretize on those segments
            Xi = M(i,:) + n(j)*(M(i+1,:) - M(i,:));
            dist(j,1) = norm(Xi-center);
        end
        g(i*length(M)) = radius - min(dist(:,1));
    end

    h=[];
end

