function [] = plotShape(X,varargin)

%PLOTSHAPE  Visual representation of landmark data.
%
%   PLOTSHAPE(X) displays the configuration X if X is m-by-k, or the 
%   superimposed n configurations if X is m-by-k-by-n.
%
%   PLOTSHAPE(X,'ProperyName',PropertyValue) alters the plotting style.
%   The range of available properties is the same as that of MATLAB's 
%   plot command; see 'help plot' for more info.
%
%   PLOTSHAPE(X,'byobs') and PLOTSHAPE(X,'bylandmark') uses different 
%   marker styles for different observations or landmarks, respectively.

%   Written by Simon Preston (http://www.maths.nott.ac.uk/~spp), 2008



[m,k,n] = size(X);
leng = k*n;

initiallyHeld = ishold;

if m==3,  z = reshape(squeeze(X(3,:,:))',[1 leng]);  end;

pntCol = {'b', 'r', 'm', 'k'};
numCol = numel(pntCol);
pntSty = {'.', 'o', 'x', 'p', 's', 'd', 'h'};
numSty = numel(pntSty);

% If no plot style is specified, default to plotting unconnected blue dots.
if isempty(varargin)
   varargin{1} = '.';
end
 
if strcmpi(varargin{1},'bylandmark')
   if m == 2
      x = squeeze(X(1,:,:));
      y = squeeze(X(2,:,:));
      plot(x(1,:),y(1,:),[pntCol{1}, pntSty{1}]);  hold on;
      for i = 2:k
         [I,J] = ind2sub([numSty numCol], mods(i,numCol*numSty));
         plot(x(i,:),y(i,:),[pntCol{J},pntSty{I}]);
      end
   elseif m == 3
      x = squeeze(X(1,:,:));
      y = squeeze(X(2,:,:));
      z = squeeze(X(3,:,:));
      plot3(x(1,:),y(1,:),z(1,:),[pntCol{1}, pntSty{1}]);  hold on;
      for i = 2:k
         [I,J] = ind2sub([numSty numCol], mods(i,numCol*numSty));
         plot3(x(i,:),y(i,:),z(i,:),[pntCol{J},pntSty{I}]);
      end
   else
      error('Shape data must be two- or three-dimensional');
   end
elseif strcmpi(varargin{1},'byobs')
   if m == 2
      x = squeeze(X(1,:,:));
      y = squeeze(X(2,:,:));
      plot(x(:,1),y(:,1),[pntCol{1}, pntSty{1}]);  hold on;
      for i = 2:n
         [I,J] = ind2sub([numSty numCol], mods(i,numCol*numSty));
         plot(x(:,i),y(:,i),[pntCol{J},pntSty{I}]);
      end
   elseif m == 3
      x = squeeze(X(1,:,:));
      y = squeeze(X(2,:,:));
      z = squeeze(X(3,:,:));     
      plot3(x(:,1),y(:,1),z(:,1),[pntCol{1}, pntSty{1}]);  hold on;
      for i = 2:n
         [I,J] = ind2sub([numSty numCol], mods(i,numCol*numSty));
         plot3(x(:,i),y(:,i),z(:,i),[pntCol{J},pntSty{I}]);
      end
   else
      error('Shape data must be two- or three-dimensional');
   end
else
   if m == 2
      x = reshape(squeeze(X(1,:,:))',[1 leng]);
      y = reshape(squeeze(X(2,:,:))',[1 leng]);      
      plot(x,y,varargin{:});
   elseif m == 3
      x = reshape(squeeze(X(1,:,:))',[1 leng]);
      y = reshape(squeeze(X(2,:,:))',[1 leng]);
      z = reshape(squeeze(X(3,:,:))',[1 leng]);
      plot3(x,y,z,varargin{:});
   else,  error('Shape data must be two- or three-dimensional');
   end
end

if ~initiallyHeld,  hold off;  end;

axis equal;
axis vis3d;


% ----------------------------------------------------------------------

function out = mods(x,n)

out = x - n*floor((x-1)/n);

