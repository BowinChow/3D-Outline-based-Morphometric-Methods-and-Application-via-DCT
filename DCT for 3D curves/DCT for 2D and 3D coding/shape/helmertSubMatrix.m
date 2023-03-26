function out = helmertSubMatrix(A)
%HELMERTSUBMATRIX   Helmert sub-matrix.
%   HELMERTSUBMATRIX(A) is the Helmert sub-matrix of dimension (A-1)*A, 
%   as defined in Dryden, I.L. and Mardia, K.V. (1998) Statistical Shape
%   Analysis (p34), Wiley, Chichester.

% MATLAB's own Helmert matrix (with different sign convention to 
% that of Dryden and Mardia) is:
foo = gallery('orthog',A,4);

% Alterations to give Dryden and Mardia's version:
out = -foo(2:end,:);