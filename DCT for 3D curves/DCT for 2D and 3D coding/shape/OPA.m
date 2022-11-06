function [Yp,T,OSS] = OPA(X,Y,scaling);

%OPA  Ordinary Procrustes analysis.
%   Yp = OPA(X,Y) for m-by-k shapes X and Y conforms Y to X by partial
%   Procrustes analysis, i.e. by translation, reflection, orthogonal
%   rotation, but not scaling.
%
%   If Y is m-by-k-by-n then Yp is also m-by-k-by-n, with Yp(:,:,i) being
%   the optimal conformation of Y(:,:,i) to X.
%
%   Yp = OPA(X,Y,true) conforms Y to X by full Procrustes analysis, i.e.
%   also including scaling.
%
%   [Yp,T,OSS] = OPA(X,Y,scaling) returns the optimal transformation in
%   structure T with fields beta (scaling), R (orthogonal rotation), and
%   a (translation) so that Yp = T.beta*T.R*Y + T.a.  It also returns the
%   Ordinary Sum of Squares (OSS) of the difference between X and Yp 
%   (OSS is the 'full Procrustes OSS' if scaling==true, and the 
%   'partial Procrustes OSS' otherwise.)

%   Written by Simon Preston (http://www.maths.nott.ac.uk/~spp), 2008

n = size(Y,3);

if nargin<3 || isempty(scaling), scaling = false; end;

if n == 1

	[m,k] = size(Y);

	% Centre
	Xmean = mean(X,2);
	Ymean = mean(Y,2);
	Xc = X - repmat(Xmean,[1 k]);
	Yc = Y - repmat(Ymean,[1 k]);

	[U1,foo,U2] = svd(Yc * Xc');
	T.R = U2 * U1';
	if scaling
		T.beta = trace(Xc'*T.R*Yc)/trace(Yc'*Yc);
	else
		T.beta = 1;
	end

	T.a = repmat(Xmean - T.beta*T.R*Ymean,[1 k]);

	Yp = T.beta*T.R*Y + T.a;

	if nargout == 3
		OSS = norm(X-Yp,'fro')^2;
	end

else

	Yp = zeros(size(Y));

	switch nargout
		case {0,1}
			for n_ = 1:n
				Yp(:,:,n_) = OPA(X,Y(:,:,n_),scaling);
			end
		case 2
			T = repmat(struct('R',[],'beta',[],'a',[]),[n 1]);
			for n_ = 1:n
				[Yp(:,:,n_),T(n_)] = OPA(X,Y(:,:,n_),scaling);
			end
		case 3
			T = repmat(struct('R',[],'beta',[],'a',[]),[n 1]);
			d = zeros(n,1);
			for n_ = 1:n
				[Yp(:,:,n_),T(n_),OSS(n_)] = OPA(X,Y(:,:,n_),scaling);
			end
	end
	
end


