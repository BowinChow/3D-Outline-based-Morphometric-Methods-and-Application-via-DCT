clc
clear
close all
t=0:10*pi/999:10*pi;
figure
for i=1:30
    [R,T,S]=Rotation(t);
    Dcurve{i}(1,:)=(1+4*t+0.2*rand(1,1)).*cos(2*t+0.2*rand(1,1)*pi);
    Dcurve{i}(2,:)=(1+4*t+0.2*rand(1,1)).*sin(2*t+0.2*rand(1,1)*pi);
    Dcurve{i}(3,:)=t+0.3*rand(1,1);
    Dcurve{i}=R*Dcurve{i}+T;
    plot3(Dcurve{i}(1,:),Dcurve{i}(2,:),Dcurve{i}(3,:),'k')
    hold on
end
hold on
for i=1:30
    [R,T,S]=Rotation(t);
    Dcurve{i+30}(1,:)=(1+2*t+0.2*rand(1,1)).*cos(t+0.2*rand(1,1)*pi);
    Dcurve{i+30}(2,:)=(1+2*t+0.2*rand(1,1)).*sin(t+0.2*rand(1,1)*pi);
    Dcurve{i+30}(3,:)=t+0.2*rand(1,1);
    Dcurve{i+30}=R*Dcurve{i+30}*S+T;
    plot3(Dcurve{i+30}(1,:),Dcurve{i+30}(2,:),Dcurve{i+30}(3,:),'b')
    hold on
end
hold on
for i=1:30
    [R,T,S]=Rotation(t);
    Dcurve{i+60}(1,:)=(1+0.5*t+0.2*rand(1,1)).*cos(t+0.2*rand(1,1)*pi);
    Dcurve{i+60}(2,:)=(1+0.5*t+0.3*rand(1,1)).*sin(t+0.3*rand(1,1)*pi);
        Dcurve{i+60}(3,:)=t+0.3*rand(1,1);
%     Dcurve{i+60}(3,:)=t;
    Dcurve{i+60}=R*Dcurve{i+60}*S+T;
    plot3(Dcurve{i+60}(1,:),Dcurve{i+60}(2,:),Dcurve{i+60}(3,:),'r')
    hold on
end
hold on
for i=1:30
    [R,T,S]=Rotation(t);
    Dcurve{i+90}(1,:)=(5+0.2*rand(1,1)).*cos(2*t+0.5*rand(1,1)*pi);
    Dcurve{i+90}(2,:)=(5+0.2*rand(1,1)).*sin(2*t+0.5*rand(1,1)*pi);
    Dcurve{i+90}(3,:)=t+0.1*rand(1,1);
    Dcurve{i+90}=R*Dcurve{i+90}*S+T;
    plot3(Dcurve{i+90}(1,:),Dcurve{i+90}(2,:),Dcurve{i+90}(3,:),'g')
    hold on
end
%%
for i=1:30
   y1= plot3(Dcurve{i}(1,:),Dcurve{i}(2,:),Dcurve{i}(3,:),'r--')
    hold on
    axis equal
end
hold on
for i=1:30
    y2=plot3(Dcurve{i+30}(1,:),Dcurve{i+30}(2,:),Dcurve{i+30}(3,:),'b')
    hold on
    axis equal
end
hold on
for i=1:30
   y3= plot3(Dcurve{i+60}(1,:),Dcurve{i+60}(2,:),Dcurve{i+60}(3,:),'g:')
    hold on
    axis equal
end
for i=1:30
    y4=plot3(Dcurve{i+90}(1,:),Dcurve{i+90}(2,:),Dcurve{i+90}(3,:),'k-.')
    hold on
    axis equal
end
legend([y1,y2,y3,y4],'Group1','Group2','Group3','Group4')
