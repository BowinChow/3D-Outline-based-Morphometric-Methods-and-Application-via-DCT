function[] = plotShapeAnimated(shape1,shape2,figTitle)
%PLOTSHAPEANIMATED  Animates between two shapes.
%
% Animate between two faces

if size(shape1) ~= size(shape2)
   error('Inputs must be equally sized')
end

[m,k,n] = size(shape1);

num_divs = 20;
alph = linspace(0,1,num_divs)';

alph2 = reshape(kron(alph',ones(m*k,1)),[m k length(alph)]);

interp_shapes = alph2.*repmat(shape1,[1 1 num_divs]) + ...
   (1-alph2).*repmat(shape2,[1 1 num_divs]);

figure;
if nargin>2, set(gcf,'Name',figTitle); end

if m == 2
   h1 = plot(...
      interp_shapes(1,:,1),...
      interp_shapes(2,:,1),'.');
elseif m == 3
   h1 = plot3(...
      interp_shapes(1,:,1),...
      interp_shapes(2,:,1),...
      interp_shapes(3,:,1),'.');
   axis vis3d; axis equal;
end

set(h1,'EraseMode','normal');

axis(1.2*[repmat([min(min(min(interp_shapes))) ...
   max(max(max(interp_shapes)))], [1 m])]);
while ishandle(h1)
   try
      for i = [1:num_divs fliplr(2:(num_divs-1))]
         pause(0.02);
         if m == 2
            set(h1,...
               'XData',interp_shapes(1,:,i),...
               'YData',interp_shapes(2,:,i));
         elseif m == 3
            set(h1,...
               'XData',interp_shapes(1,:,i),...
               'YData',interp_shapes(2,:,i),...
               'ZData',interp_shapes(3,:,i));
         end
         drawnow;
      end
   catch
      break
   end
end

