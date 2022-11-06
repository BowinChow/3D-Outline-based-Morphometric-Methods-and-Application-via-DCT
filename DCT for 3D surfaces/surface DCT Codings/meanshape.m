function [AS] = meanshape(P)
x_mean=[];
y_mean=[];
y_mean=[];

N=length(P);
for i=1:N
    x(i,:)=P{i}(1,:);
    y(i,:)=P{i}(2,:);
    z(i,:)=P{i}(3,:);
end
x_mean=mean(x);
y_mean=mean(y);
z_mean=mean(z);
AS=[x_mean;y_mean;z_mean];