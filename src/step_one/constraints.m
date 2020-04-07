function [g h] = constraints(x, A, B, center, radius)
    M = [A ; x ; B]; % Segments matrix
    n = 0:0.01:1; % Discretize
    for i=1:length(M)-1 % for all segments
        for j=1:length(n) % for all points discretize on those segments
            Xi = M(i,:) + n(j)*(M(i+1,:) - M(i,:));
            dist(j,1) = norm(Xi-center);
        end
        g(i)= radius - min(dist(:,1));
    end

    h=[];
end

