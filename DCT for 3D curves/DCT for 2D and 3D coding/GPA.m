function [Xp,G] = GPA(X,scaling,tol)
%GPA  Generalised Procrustes analysis.
%   [Xp,G] = GPA(X) for X being an m-by-k-by-n sample of shape data returns
%   as Xp these shapes matched by translation, reflection, orthogonal 
%   rotation to minimise G, a quantity proportional to the sum of squared 
%   norms of pairwise differences. See Dryden, I.L. and Mardia, K.V. (1998)
%   Statistical Shape Analysis (p88), Wiley, Chichester.
%
%   [Xp,G] = GPA(X,true) includes the scaling transform.
%
%   The algorithm originates from the following sources:
%   Gower, J.C. (1975). Generalized Procrustes analysis,
%       Psychometrika, 40, 33–50.
%   Ten Berge, J.M.F. (1977). Orthogonal Procrustes rotation for two or
%       more matrices. Psychometrika, 42, 267-276.

%   Written by Simon Preston (http://www.maths.nott.ac.uk/~spp), 2008

if nargin<3,  tol = 1e-6;  end
if tol<1e-16,  tol=1e-16;  end
if nargin<2,  scaling = false;  end

[m,k,n] = size(X);

centroids = mean(X,2);
Xc = X - reshape(kron(squeeze(centroids),ones(1,k)),[m k n]);

Xp = Xc;

Xbar = zeros(size(X));

Gold = 1e16;  G = 1e15;

numIterations = 0;

while (Gold-G) > tol

	% Rotation
	while (Gold-G) > tol
		Gold = G;
		for n_=1:n;
			Xbar = mean(Xp(:,:,[1:n_-1 n_+1:n]),3);
			Xp(:,:,n_) = OPA(Xbar, Xp(:,:,n_));
		end
		G = getG(Xp,m,k,n);
	end

	if scaling
		% Scaling
		beta = zeros(1,n);
		vecXp = reshape(Xp,[m*k n]);
		Phi = corr(vecXp);
		[a,b] = eigSort(Phi);
		sumOfSquaredNorms = 0;
		for n_ = 1:n
			sumOfSquaredNorms = sumOfSquaredNorms + norm(Xp(:,:,n_),'fro')^2;
		end
		for n_ = 1:n
			beta(n_) = sqrt(sumOfSquaredNorms/norm(Xp(:,:,n_),'fro')^2)*a(n_,1);
			Xp(:,:,n_) = beta(n_) * Xp(:,:,n_);
		end
		G = getG(Xp,m,k,n);
	end

end


% -----------------------------------------------------------------------
function G = getG(Xp,m,k,n)
Xps = reshape(Xp,[m*k n]);
G = 0;
for n_ = 1:n
	G = G + sum(sum((repmat(Xps(:,n_), [1 n-n_]) - Xps(:,n_+1:n)).^2));
end
G = G/n;


% -----------------------------------------------------------------------
function G = getG2(Xp,m,k,n)
G = 0;
for n1_ = 1:n
	for n2_ = (n1_+1):n
		G = G + norm(Xp(:,:,n1_) - Xp(:,:,n2_),'fro')^2;
	end
end
G = G/n;

