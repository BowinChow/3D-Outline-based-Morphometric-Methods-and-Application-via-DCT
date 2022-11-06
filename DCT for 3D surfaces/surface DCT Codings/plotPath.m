function  plotPath(curve)
plot3(curve{1}(1,:),curve{1}(2,:),curve{1}(3,:),'bo-','linewidth',2);
for  ii=1:length(curve{1})
 text(curve{1}(1,ii)+0.5,curve{1}(2,ii),curve{1}(3,ii)-2, num2str(ii))
end
 axis equal
 grid on
end

