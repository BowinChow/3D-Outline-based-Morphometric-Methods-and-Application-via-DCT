% clear;clc;close all;
% % �ȿ�һ��Ĭ����ɫ����ʵ���Ǻ�Ư������ɫ
% figure;
% DemoPlot();
% 
% clear;clc;close all;
% % �ȿ�һ��Ĭ����ɫ����ʵ���Ǻ�Ư������ɫ
% figure;
% DemoPlot();
% 
% function DemoPlot()
% % ����һ���򵥵Ļ�ͼ����
% x = 1:100;
% y = log(x);
% for i = 1:6
%     plot(x, y + 3*i, 'LineWidth', 5);
%     hold on
% end
% hold off
% end

[all_themes, all_colors] = GetColors();
% ����subplot

for j = 1 : 6
  figure;
    DemoPlot();
    % �����޸�һ����ɫ˳��colororder����
    set(gca, 'colororder', all_themes{j});
end

function DemoPlot()
% ����һ���򵥵Ļ�ͼ����
x = 1:100;
y = log(x);
for i = 1:6
    plot(x, y + 3*i, 'LineWidth', 5);
    hold on
end
hold off
end