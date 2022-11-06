plot3(NS2{1}(1,:),NS2{1}(2,:),NS2{1}(3,:),'b');


for  ii=1:length(NS2{1})

 text(NS2{1}(1,ii),NS2{1}(2,ii),NS2{1}(3,ii), num2str(ii))

end
 axis equal
 grid on
