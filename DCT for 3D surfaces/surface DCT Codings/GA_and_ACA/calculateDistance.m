function [ distances ] = calculateDistance( point )
%Calculating Distance
[row, col] = size(point);
distances = zeros(col);
if row==2
    for i=1:col
        for j=1:col
            distances(i,j)= distances(i,j)+ sqrt( (point(1,i)-point(1,j))^2 + (point(2,i)-point(2,j))^2  );
        end
    end
else
    for i=1:col
        for j=1:col
            distances(i,j)= distances(i,j)+ sqrt( (point(1,i)-point(1,j))^2 + (point(2,i)-point(2,j))^2 +(point(3,i)-point(3,j))^2 );
        end
    end
end

end