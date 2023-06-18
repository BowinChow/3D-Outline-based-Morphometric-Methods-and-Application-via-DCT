% clear;clc;close all;
% % 先看一下默认颜色，其实还是很漂亮的颜色
% figure;
% DemoPlot();
% 
% clear;clc;close all;
% % 先看一下默认颜色，其实还是很漂亮的颜色
% figure;
% DemoPlot();
% 
% function DemoPlot()
% % 定义一个简单的绘图函数
% x = 1:100;
% y = log(x);
% for i = 1:6
%     plot(x, y + 3*i, 'LineWidth', 5);
%     hold on
% end
% hold off
% end
% 类似subplot

for j = 1 : 1
  figure;
    DemoPlot();
    % 这里修改一下颜色顺序colororder即可
 
end

function DemoPlot()
% 定义一个简单的绘图函数
x = 1:100;
y = log(x);
for i = 1:6
    color = [255 123 100];
    plot(x, y + 3*i, 'LineWidth', 5,'color', RGB2Color(color));
    hold on
end
hold off
end