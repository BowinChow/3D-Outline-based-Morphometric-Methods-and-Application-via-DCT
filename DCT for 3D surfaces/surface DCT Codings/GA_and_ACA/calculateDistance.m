function [ distances ] = calculateDistance( ponit )
%Calculating Distance
[row, col] = size(point);
distances = zeros(col);
if row==2
    for i=1:col
        for j=1:col
            distances(i,j)= distances(i,j)+ sqrt( (ponit(1,i)-ponit(1,j))^2 + (ponit(2,i)-ponit(2,j))^2  );
        end
    end
else
    for i=1:col
        for j=1:col
            distances(i,j)= distances(i,j)+ sqrt( (ponit(1,i)-ponit(1,j))^2 + (ponit(2,i)-ponit(2,j))^2 +(ponit(3,i)-ponit(3,j))^2 );
        end
    end
end

end