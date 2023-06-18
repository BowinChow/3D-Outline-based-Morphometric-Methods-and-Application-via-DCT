function plot3DCurves(A,B,index)
cur1= A{index};
cur2 = B{index};
figure 
plot3(cur1(1,:),cur1(2,:),cur1(3,:),'r:','linewidth',2);
hold on
plot3(cur2(1,:),cur2(2,:),cur2(3,:),'b:','linewidth',2);
axis equal
grid on
box off
view(-50,20);
end

