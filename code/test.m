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
[filename,pathname,filterindex]=uigetfile('*.mat','������');
s1=load (strcat([pathname filename])); %strcat�����·���ģ��ǲ����ǲ�����ôд�ˡ�
msgbox('�򿪼���ȡ�������!','ȷ��','warn');

function readData()
[filename,pathname,filterindex]=uigetfile('*.mat','������');
strcat([pathname filename])
data = load (strcat([pathname filename])); %strcat�����·���ģ��ǲ����ǲ�����ôд�ˡ�
end
