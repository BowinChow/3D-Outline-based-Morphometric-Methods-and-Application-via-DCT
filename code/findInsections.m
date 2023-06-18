function [insec,seg] = findInsections(curve)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
global LINE_WIDTH;
LINE_WIDTH = 2.5;

[insec_x, insec_y, seg_start, seg_end] = intersections(curve{1}(1, :), curve{1}(2, :), curve{2}(1, :), curve{2}(2, :), 1);
figure
plot(curve{1}(1, :), curve{1}(2, :),'m:','linewidth',LINE_WIDTH);
hold on
plot(curve{2}(1, :), curve{2}(2, :),'g--','linewidth',LINE_WIDTH);
hold on
plot(insec_x, insec_y, 'ro', 'markersize', 6,'markerfacecolor','r');
axis equal
grid on
insec=zeros(2,length(insec_x));
seg = zeros(2,length(insec_x));
insec(1,:) = insec_x;
insec(2,:) = insec_y;
seg(1,:) = seg_start;
seg(2,:)  = seg_end;
end

