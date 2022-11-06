function out = dehelm(X)
%DEHELM  de-Helmertise shape data.
%   DEHELM(X) is the de-Helmertised version of X, i.e. 
%   m-by-k if X is m-by-(k-1), or m-by-k-by-n if X is m-by-(k-1)-by-n.
%
%   Note that DEHELM(HELM(X)) gives the same result as CENTRE(X).

[m,kMinusOne,n] = size(X);

foo = gallery('orthog',kMinusOne+1,4);
helmertSubMatrix = -foo(2:end,:);

out = permute(reshape((reshape(...
	permute(X,[1 3 2]),n*m,kMinusOne)*...
	helmertSubMatrix)',[kMinusOne+1 m n]),[2 1 3]); 