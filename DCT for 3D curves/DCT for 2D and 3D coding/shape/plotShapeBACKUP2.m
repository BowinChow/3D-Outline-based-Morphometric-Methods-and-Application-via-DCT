function [] = plotShape(X,varargin)

[m,k,n] = size(X);
leng = k*n;

% If no plot style is specified, default to plotting unconnected blue dots.
if isempty(varargin), varargin{1} = '.'; end;

if m == 2
      plot(...
         reshape(squeeze(X(1,:,:))',1,leng),...
         reshape(squeeze(X(2,:,:))',1,leng),varargin{:});
elseif m == 3
      plot3(...
         reshape(squeeze(X(1,:,:))',1,leng),...
         reshape(squeeze(X(2,:,:))',1,leng),...
         reshape(squeeze(X(3,:,:))',1,leng),varargin{:});
else
   error('Shape data must be two- or three-dimensional');
end

axis equal;
axis vis3d;

