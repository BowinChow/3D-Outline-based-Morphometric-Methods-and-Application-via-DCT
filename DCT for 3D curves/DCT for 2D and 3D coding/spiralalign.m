clc
figure
N=length(Dcurve);
for i=1:N
    X(:,:,i)=Dcurve{i};
end
[Xp,G]=GPA(X,true,1e-6);
for i=1:N
    NDcurve{i}=Xp(:,:,i);
end
for i=1:30
    y1=plot3(NDcurve{i}(1,:),NDcurve{i}(2,:),NDcurve{i}(3,:),'r--')
    hold on
    axis equal
end
hold on
for i=1:30
   y2= plot3(NDcurve{i+30}(1,:),NDcurve{i+30}(2,:),NDcurve{i+30}(3,:),'b')
    hold on
    axis equal
end
hold on
for i=1:30
    y3=plot3(NDcurve{i+60}(1,:),NDcurve{i+60}(2,:),NDcurve{i+60}(3,:),'g:')
    hold on
    axis equal
end
for i=1:30
    y4=plot3(NDcurve{i+90}(1,:),NDcurve{i+90}(2,:),NDcurve{i+90}(3,:),'k-.')
    hold on
    axis equal
end
legend([y1,y2,y3,y4],'Group1','Group2','Group3','Group4')
