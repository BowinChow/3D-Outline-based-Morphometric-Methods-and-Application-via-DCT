for i=1:63
    if P(i)==2
       y1= plot3(NS1{i}(1,:),NS1{i}(2,:),NS1{i}(3,:),'b.','markersize',12)
        hold on
        plot3(NS2{i}(1,:),NS2{i}(2,:),NS2{i}(3,:),'b.','markersize',12)
        hold on
    elseif P(i)==4
       y2= plot3(NS1{i}(1,:),NS1{i}(2,:),NS1{i}(3,:),'ks','markerfacecolor','k','markersize',5)
        hold on
        plot3(NS2{i}(1,:),NS2{i}(2,:),NS2{i}(3,:),'ks','markerfacecolor','k','markersize',5)
        hold on
    end
end
legend([y1 y2],'BCS','Unaffected')
axis equal
grid on