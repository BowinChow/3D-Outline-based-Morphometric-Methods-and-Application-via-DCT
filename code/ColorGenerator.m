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
% ����subplot

for j = 1 : 1
  figure;
    DemoPlot();
    % �����޸�һ����ɫ˳��colororder����
 
end

function DemoPlot()
% ����һ���򵥵Ļ�ͼ����
x = 1:100;
y = log(x);
for i = 1:6
    color = [255 123 100];
    plot(x, y + 3*i, 'LineWidth', 5,'color', RGB2Color(color));
    hold on
end
hold off
end