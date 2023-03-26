function Z = MDSmean(X,locPreRemoved)
% MDSMEAN  Mean shape calculated by multidimensional scaling.
%   Z = MDSMEAN(X) is the m-by-k multidimensional-scaling mean shape of 
%   the m-by-k-by-n sample X.  

%   Written by Simon Preston (http://www.maths.nott.ac.uk/~spp), 2008

if nargin<2 || isempty(locPreRemoved)
	locPreRemoved = false;
end

[m,k,n] = size(X);

if ~locPreRemoved
	X = centre(X);
end

XTX = zeros(k,k,n);
for n_=1:n
	XTX(:,:,n_) = X(:,:,n_)'*X(:,:,n_);
end

[a,b] = eigSort(mean(XTX,3));

bVect = diag(b);

Z = zeros(m,k);
for m_=1:m
	Z(m_,:) = sqrt(bVect(m_))*a(:,m_)';
end


% -----------------------------------------------------------------------

function Xc = centre(X)
%CENTRE  Centres shapes data.
%   CENTRE(X) is the centred version of m-by-k-by-n shape sample X.

[m,k,n] = size(X);

centroids = mean(X,2);
Xc = X - reshape(kron(squeeze(centroids),ones(1,k)),[m k n]);


% -----------------------------------------------------------------------
function G = getG(Xp,m,k,n)
Xps = reshape(Xp,[m*k n]);
G = 0;
for n_ = 1:n
	G = G + sum(sum((repmat(Xps(:,n_), [1 n-n_]) - Xps(:,n_+1:n)).^2));
end
G = G/n;
