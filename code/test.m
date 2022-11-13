clc;
clear;
close all
a = zeros(4,5);
for i = 1:length(a(:,1))
    a(i,:)=ones(1,5);
end
x = 0:0.1:2*pi;
y = sin(x);
y2 = cos(2*x);
figure 
plot(x,y,".");
hold on
plot(x,y2,"r:");
axis equal;
grid on
[filename,pathname,filterindex]=uigetfile('*.mat','打开数据');
s1=load (strcat([pathname filename])); %strcat是组成路径的，记不得是不是这么写了。
msgbox('打开及读取数据完毕!','确认','warn');

function readData()
[filename,pathname,filterindex]=uigetfile('*.mat','打开数据');
strcat([pathname filename])
data = load (strcat([pathname filename])); %strcat是组成路径的，记不得是不是这么写了。
end
