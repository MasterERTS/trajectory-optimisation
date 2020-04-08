function [g h] = constraints(x, A, B, center1, center2, radius)
    x1 = [x(1), x(2)];
    x2 = [x(3), x(4)];
    x3 = [x(5), x(6)];
    x4 = [x(7), x(8)];
    x5 = [x(9), x(10)];
    M = [A ; x1 ; x2 ; x3 ; x4 ; x5 ; B];
    centers = [center1; center2];
    n = 0:0.001:1; % Discretize
    for k = 1:length(centers)
        for i=1:length(M)-1 % for all segments
            for j=1:length(n) % for all points discretize on those segments
                Xi = M(i,:) + n(j)*(M(i+1,:) - M(i,:));
                dist(j,1) = norm(Xi - centers(k, :));
            end
            g(i+(k-1)*length(M)) = radius - min(dist(:,1));
        end
    end

    h=[];
end

