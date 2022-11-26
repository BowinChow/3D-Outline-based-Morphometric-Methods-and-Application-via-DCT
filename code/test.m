clc
close all 
clear
P = [0 0; 1 1; 1.5 0.5; 1.5 -0.5; 1.25 0.3; 1 0; 1.25 -0.3; 1 -1];
data = P;
alpha = 0.6;
str = '#F1A1C4';
lineColor =  '#5F21C4';
y1 = drawConvexHull(data,alpha,str,lineColor);
hold on
P1 = zeros(length(P),length(P(1,:)));
P1(:,1) = P(:,1)*0.8+2;
P1(:,2) = P(:,2)*0.5+3;
str = '#29A1C4';
lineColor =  '#5F21C4';
y2 = drawConvexHull(P1,alpha,str,lineColor);
legend([y1,y2],'convex1','convex2')
legend('boxoff')
figure
t = [-50.9 11.1 24.8 3.2 -17.8 6.8 11.6 1.6 31.42 7.2 53.2]';
x1 = [67.3 111.3 173.0 80.8 199.7 139.4 368.2 95.7 109.6 196.2 102.2]';

% t = rand(100,1);
% x1 = rand(100,1);

A = [t,x1];
p = 0.95;
errorEllipse(A,p)


