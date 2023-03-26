function Xc = centre(X)
%CENTRE  Centres shapes data.
%   Xc = CENTRE(X) is the centred version of m-by-k-by-n shape sample X,
%   i.e. Xc(:,:,i) = X(:,:,i) - mean(X(:,:,i),2); for i = 1,...,n.

[m,k,n] = size(X);

centroids = mean(X,2);
Xc = X - reshape(kron(squeeze(centroids),ones(1,k)),[m k n]);