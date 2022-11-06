function [childPath] = crossover(parentPath1, parentPath2, prob)
% ½»²æ

random = rand();
if prob >= random
    [l, length] = size(parentPath1);
    childPath = zeros(l,length);
    setSize = floor(length/2) -1;
    offset = randi(setSize);
    for i=offset:setSize+offset-1
        childPath(1,i) = parentPath1(1,i);
    end
    iterator = i+1;
    j = iterator;
    while any(childPath == 0)
        if j > length
            j = 1;
        end
        
        if iterator > length
            iterator = 1;
        end
        if ~any(childPath == parentPath2(1,j))
            childPath(1,iterator) = parentPath2(1,j);
            iterator = iterator + 1;
        end
        j = j + 1;
    end
else
    childPath = parentPath1;
end