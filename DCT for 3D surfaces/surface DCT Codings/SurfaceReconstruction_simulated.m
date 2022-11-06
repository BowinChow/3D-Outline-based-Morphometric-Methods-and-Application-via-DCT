function SurfaceReconstruction_simulated(NS,FS)
figure
plot3(NS(1,:),NS(2,:),NS(3,:),'b.','markersize',2)
axis equal
plt_index=1:110;
hold on
y1=plot3(NS(1,plt_index),NS(2,plt_index),NS(3,plt_index),'b','linewidth',1.5);
hold on
for i=1:11
    ind=[i 23-i 22+i 45-i 44+i 67-i 66+i 89-i 88+i 111-i];
    plot3(NS(1,ind),NS(2,ind),NS(3,ind),'b','linewidth',1.5)
    hold on
end
%%
plot3(FS(1,:),FS(2,:),FS(3,:),'ro','markersize',1)
axis equal
plt_index=1:110;
hold on
y2=plot3(FS(1,plt_index),FS(2,plt_index),FS(3,plt_index),'r:','linewidth',1.5);
hold on
for i=1:11
    ind=[i 23-i 22+i 45-i 44+i 67-i 66+i 89-i 88+i 111-i];
    plot3(FS(1,ind),FS(2,ind),FS(3,ind),'r:','linewidth',1.5)
    hold on
end
legend([y1,y2],'Original surface','Fitted suface')
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on
end
