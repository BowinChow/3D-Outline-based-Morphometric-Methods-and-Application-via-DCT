function [out] = unit(in,dim)

% - if 'in' is a vector, 'out' is the normalised vector
% - if 'in' is a matrix and 'dim' not specified, returns Frobenius norm 
% - if 'in' is a matrix and 'dim' is specified, returns matrix normalised
%      along dimension 'dim'

if nargin==1
	out = in/norm(in,'fro');
else
	foo = ones(1,length(size(in))); foo(dim) = size(in,dim);
	out = in./repmat(sqrt(sum(in.^2,dim)), foo);
end


	
	