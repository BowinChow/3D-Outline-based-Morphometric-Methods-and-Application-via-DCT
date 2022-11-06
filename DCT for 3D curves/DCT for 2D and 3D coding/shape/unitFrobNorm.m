function out = unitFrobNorm(X)
%UNITFROBNORM  Rescale input to have unit Frobenius norm.
%   Z = UNITFROBNORM(X) for X m-by-k returns X/|X| where || denotes the 
%   Frobenius norm.  For X m-by-k-by-n,
%     Z(:,:,i) = X(:,:,i)/|X(:,:,i)|; where i=1,...,n.

[m,k,n] = size(X);

out = X./reshape(kron(sqrt(...
	squeeze(sum(sum(X.^2,1),2))),ones(m,k))',[m k n]);

