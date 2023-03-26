function out = helm(X)
%HELM  Helmertise shape data.
%   HELM(X) is the Helmertised version of X, i.e. 
%   m-by-(k-1) if X is m-by-k, or m-by-(k-1)-by-n if X is m-by-k-by-n

[m,k,n] = size(X);

foo = gallery('orthog',k,4);
helmertSubMatrix = -foo(2:end,:);

out = permute(reshape((reshape(...
	permute(X,[1 3 2]),n*m,k)*...
	helmertSubMatrix')',[k-1 m n]),[2 1 3]); 