function SurfaceReconstructionS1(NS,FS)
figure
plot3(NS(1,:),NS(2,:),NS(3,:),'b.','markersize',2)
axis equal
plt_index=[1:21 60:-1:40 1 ];
hold on
y1=plot3(NS(1,plt_index),NS(2,plt_index),NS(3,plt_index),'b','linewidth',2);
hold on
plot3(NS(1,21:40),NS(2,21:40),NS(3,21:40),'b','linewidth',2)
hold on
for i=2:19
    ind=[i 41-i 40+i];
    plot3(NS(1,ind),NS(2,ind),NS(3,ind),'b','linewidth',2)
    hold on
end
%%
addpath("..\code")
color = [255 123 100];
color = RGB2Color(color);
plot3(FS(1,:),FS(2,:),FS(3,:),'o','markersize',1,'color',color)
axis equal
plt_index=[1:21 60:-1:40 1 ];
hold on
y2=plot3(FS(1,plt_index),FS(2,plt_index),FS(3,plt_index),'r:','linewidth',2);
hold on
plot3(FS(1,21:40),FS(2,21:40),FS(3,21:40),':','linewidth',2,'color',color)
hold on
for i=2:19
    ind=[i 41-i 40+i];
    plot3(FS(1,ind),FS(2,ind),FS(3,ind),':','linewidth',2,'color',color)
    hold on
end
legend([y1 y2],'Original surface','Fitted surface')
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on
end

