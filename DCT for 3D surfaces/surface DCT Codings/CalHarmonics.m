function [S] = CalHarmonics(X)
[XX,ind] = sort(abs(X),'descend');
i = 1;
while norm(X(ind(1:i)))/norm(X)<0.995
    i = i + 1;
end
S=ind(1:i);
end

