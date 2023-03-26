function [ mutatedPath ] = mutate( path, prob )
%Update the path identified with certain possiblility
random = rand();
if random <= prob
    [l,length] = size(path);
    index1 = randi(length);
    index2 = randi(length);
    %% Exchange
    temp = path(l,index1);
    path(l,index1) = path(l,index2);
    path(l,index2)=temp;
end
mutatedPath = path;
end