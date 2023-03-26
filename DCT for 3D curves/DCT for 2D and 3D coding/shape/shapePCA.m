function expl = shapePCA(X,whichPCs,numSDs,animatedPlot,MDSorGPA,PAtype)
%SHAPEPCA  Analyse shape variation using principal component analysis.
%  SHAPEPCA(X) displays plots for the variation at +/- 3 SDs along
%  the first 4 PCs.
%
%  Z = SHAPEPCA(X) is the percentage variation explained by each principal
%  component.
% 
%  There are several optional arguments (the defaults shown in square
%  brackets):
%     whichPCs [1:4]: the PCs for which to plot;
%     numSDs [3]: number of SDs for which to show variation along each PC;
%     animatedPlot [false]: if true then an animated plot is shown for
%        the variation along PC whichPCs(1);
%     MDSorGPA ['mds']: if false or 'mds' then MDS is used to calculate 
%        the mean shape, else if true or 'gpa' then GPA is used.
%        Alternatively MDSorGPA can be a user-prescribed m-by-k 
%        configuration;
%     PAtype [false]: if false then partial Procrustes analysis is used;
%        if true then full Procrustes analysis is used.

%   Written by Simon Preston (http://www.maths.nott.ac.uk/~spp), 2008


if nargin < 6 || isempty(PAtype),  PAtype = false;  end;
if nargin < 5 || isempty(MDSorGPA),  MDSorGPA = 'mds';  end;
if nargin < 4 || isempty(animatedPlot),  animatedPlot = false;  end;
if nargin < 3 || isempty(numSDs),  numSDs = 3;  end;
if nargin < 2 || isempty(whichPCs),  whichPCs = 1:4;  end;

[m,k,n] = size(X);

Y = unitFrobNorm(centre(X));

if (numel(MDSorGPA)==1 && (MDSorGPA==false)) || strcmpi(MDSorGPA,'mds')
   Ymean = MDSmean(Y,true);
   Yp = OPA(Ymean,Y,PAtype);
elseif (numel(MDSorGPA)==1 && MDSorGPA==true) || strcmpi(MDSorGPA,'gpa')
   Yp = GPA(Y,PAtype);
   Ymean = mean(Yp,3);
elseif size(MDSorGPA) == size(X(:,:,1))
   Ymean = MDSorGPA;
   Yp = OPA(Ymean,Y,PAtype);
else
   error('Fifth argument (MDSorGPA) is invalid: consult ''help shapePCA''');
end
   

% Project onto tangent space
YpT = zeros(m*(k),n);
projector = eye(m*(k)) - vec(Ymean)*vec(Ymean)';
for i = 1:n
   YpT(:,i) = projector*vec(Yp(:,:,i));
end

covar = cov(YpT');

[evecs, variances] = eigSort(covar);
expl = 100*(variances/sum(variances));

YPCplus = zeros([m k m*(k)]);
YPCminus = zeros([m k m*(k)]);
for i = 1:(m*(k))
   v = evecs(:,i)*numSDs*sqrt(variances(i,i));
   YPCplus(:,:,i) = reshape(v + sqrt(1-v'*v)*vec(Ymean),[m k]);
   YPCminus(:,:,i) = reshape(-v + sqrt(1-v'*v)*vec(Ymean),[m k]);
end

if animatedPlot
   if numel(whichPCs) > 1
      warning(['When animatedPlot==true, only a plot for the first ',...
         'specified PC [i.e. whichPCs(1)] is shown']);
   end
   figTitle = ['PC ',num2str(whichPCs(1)),'. Explains ',...
      num2str(expl(whichPCs(1)),3),...
      '% of variation', ...
      ' (plotted along ',num2str(numSDs), ' SDs)'];
   plotShapeAnimated(...
      YPCplus(:,:,whichPCs(1)),YPCminus(:,:,whichPCs(1)),figTitle);
else
   h = zeros(1,length(whichPCs));
   figh = zeros(1,length(whichPCs));
   for iPC = 1:length(whichPCs)
      PC = whichPCs(iPC);
      figh(iPC)=figure; axis vis3d; axis equal; hold on; h(iPC) = gca;
      figTitle = ['PC ',num2str(PC),'. Explains ',...
         num2str(expl(PC),3),...
         '% of variation', ...
         ' (plotted along ',num2str(numSDs), ' SDs)'];
      set(gcf,'Name',figTitle);
      % title(figTitle)
      if m == 2
         for i = 1:k
            plot(...
               cat(1,YPCplus(1,i,PC),Ymean(1,i)),...
               cat(1,YPCplus(2,i,PC),Ymean(2,i)));
            plot(...
               cat(1,Ymean(1,i),YPCminus(1,i,PC)),...
               cat(1,Ymean(2,i),YPCminus(2,i,PC)),'Color',[.9 .9 1])
            plot(Ymean(1,i),Ymean(2,i),'.');
         end
      elseif m == 3
         for i = 1:k
            plot3(...
               cat(1,YPCplus(1,i,PC),Ymean(1,i)),...
               cat(1,YPCplus(2,i,PC),Ymean(2,i)),...
               cat(1,YPCplus(3,i,PC),Ymean(3,i)));
            plot3(...
               cat(1,Ymean(1,i),YPCminus(1,i,PC)),...
               cat(1,Ymean(2,i),YPCminus(2,i,PC)),...
               cat(1,Ymean(3,i),YPCminus(3,i,PC)),'Color',[.9 .9 1])
            plot3(Ymean(1,i),Ymean(2,i),Ymean(3,i),'.');
         end
      end
   end
   % Links the axes properties
   hlink = linkprop(h,{'CameraPosition','CameraUpVector',...
      'CameraViewAngle'});
   key = 'graphics_linkprop';
   setappdata(h(1),key,hlink);
   set(h(1),'CameraViewAngle',9);  % Zoom out a little
   tilefigs(figh);
end

%plotFaceAnimated(PC_lines_Y(:,:,PC),PC_lines_Yb(:,:,PC));


