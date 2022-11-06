function [NL] = pathUniform(NS1,bestPath)
for i=1:length(NS1)
    NL{i}=NS1{i}(:,bestPath);
%     figure
%     plot3(NL{i}(1,:),NL{i}(2,:),NL{i}(3,:),'b')
end
% axis equal 
% grid on
end

