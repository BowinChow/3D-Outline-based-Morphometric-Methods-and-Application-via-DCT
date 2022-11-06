function [ U0 ] = Creat_3DCurves( N_Curves )
figure('Position',[100 50 1000 580])
hold on
axis equal
axis([-50 50 -50 50])
grid minor
view([0 0 1])
for ii = 1:N_Curves
    clear u
    [u(1,1),u(2,1),button] = ginput(1);
    u(3,1) = 0;
    while button == 1
        plot3(u(1,end),u(2,end),u(3,end),'k*')
        
        [u(1,end+1),u(2,end),button] = ginput(1);
        u(3,end) = 2*(rand-0.5)*sum((u(1:2,end)-u(1:2,end-1)).^2,1)^0.5;
        if button ~= 1
            break
        end
        
        delete(findobj('tag','update'))
        U0{ii,1} = fnplt(cscvn(u));
        plot3(U0{ii,1}(1,:),U0{ii,1}(2,:),U0{ii,1}(3,:),'b-','linewidth',1.5,'tag','update')
    end
    u(:,end) = [];
    delete(findobj('tag','update'))
    plot3(U0{ii,1}(1,:),U0{ii,1}(2,:),U0{ii,1}(3,:),'b-','linewidth',1.5)
end
close all
end

