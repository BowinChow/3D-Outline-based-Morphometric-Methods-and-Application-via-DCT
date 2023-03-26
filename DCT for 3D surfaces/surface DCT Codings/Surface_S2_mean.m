NDcurve=curve;
N=length(NDcurve);
G1=[];G2=[];G3=[];G4=[];
ctr1=1;ctr2=1;ctr3=1;ctr4=1;
for i=1:N
    if P(i)==1
        G1{ctr1}=NDcurve{i};
        ctr1=ctr1+1;
    elseif P(i)==2
        G2{ctr2}=NDcurve{i};
        ctr2=ctr2+1;
    elseif P(i)==3
        G3{ctr3}=NDcurve{i};
        ctr3=ctr3+1;
    else
        G4{ctr4}=NDcurve{i};
        ctr4=ctr4+1;
    end
end

[G1m]=meanshape(G1);

%y1=SurfaceReconstructionS11(G1m,'r')
NS=G1m;
color='r';
plot3(NS(1,:),NS(2,:),NS(3,:),color,'markersize',2)
axis equal
plt_index=[1:21 60:80 41 40 1];
hold on
y1=plot3(NS(1,plt_index),NS(2,plt_index),NS(3,plt_index),color,'linewidth',2)
hold on
plot3(NS(1,21:40),NS(2,21:40),NS(3,21:40),color,'linewidth',2)
hold on
plot3(NS(1,41:60),NS(2,41:60),NS(3,41:60),color,'linewidth',2)
hold on
for i=2:19
    ind=[i 41-i 40+i 81-i];
    plot3(NS(1,ind),NS(2,ind),NS(3,ind),color,'linewidth',2)
    hold on
end
hold on
[G2m]=meanshape(G2);
%y2=SurfaceReconstructionS11(G2m,'b:')
NS=G2m;
color='b:';
plot3(NS(1,:),NS(2,:),NS(3,:),color,'markersize',2)
axis equal
plt_index=[1:21 60:80 41 40 1];
hold on
y2=plot3(NS(1,plt_index),NS(2,plt_index),NS(3,plt_index),color,'linewidth',2)
hold on
plot3(NS(1,21:40),NS(2,21:40),NS(3,21:40),color,'linewidth',2)
hold on
plot3(NS(1,41:60),NS(2,41:60),NS(3,41:60),color,'linewidth',2)
hold on
for i=2:19
    ind=[i 41-i 40+i 81-i];
    plot3(NS(1,ind),NS(2,ind),NS(3,ind),color,'linewidth',2)
    hold on
end
hold on
[G3m]=meanshape(G3);
%y3=SurfaceReconstructionS11(G3m,'g:.')
NS=G3m;
color='g:.';
plot3(NS(1,:),NS(2,:),NS(3,:),color,'markersize',2)
axis equal
plt_index=[1:21 60:80 41 40 1];
hold on
y3=plot3(NS(1,plt_index),NS(2,plt_index),NS(3,plt_index),color,'linewidth',2)
hold on
plot3(NS(1,21:40),NS(2,21:40),NS(3,21:40),color,'linewidth',2)
hold on
plot3(NS(1,41:60),NS(2,41:60),NS(3,41:60),color,'linewidth',2)
hold on
for i=2:19
    ind=[i 41-i 40+i 81-i];
    plot3(NS(1,ind),NS(2,ind),NS(3,ind),color,'linewidth',2)
    hold on
end
hold on
[G4m]=meanshape(G4);
%y4=SurfaceReconstructionS11(G4m,'k--')
NS=G4m;
color='k--';
plot3(NS(1,:),NS(2,:),NS(3,:),color,'markersize',2)
axis equal
plt_index=[1:21 60:80 41 40 1];
hold on
y4=plot3(NS(1,plt_index),NS(2,plt_index),NS(3,plt_index),color,'linewidth',2)
hold on
plot3(NS(1,21:40),NS(2,21:40),NS(3,21:40),color,'linewidth',2)
hold on
plot3(NS(1,41:60),NS(2,41:60),NS(3,41:60),color,'linewidth',2)
hold on
for i=2:19
    ind=[i 41-i 40+i 81-i];
    plot3(NS(1,ind),NS(2,ind),NS(3,ind),color,'linewidth',2)
    hold on
end
grid on
axis equal
legend([y1,y2,y3,y4],'Group1','Group2','Group3','Group4')