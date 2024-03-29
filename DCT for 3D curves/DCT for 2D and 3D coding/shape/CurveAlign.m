
N=length(U_Points);

for i=1:N
    X(:,:,i)=U_Points{i};
end
[Xp,G]=GPA(X,true,1e-6);
for i=1:N
    U0_Points{i}=Xp(:,:,i);
end
% for i=1:30
%     plot3(NDcurve{i}(1,:),NDcurve{i}(2,:),NDcurve{i}(3,:),'k')
%     hold on
%     axis equal
% end
% hold on
% for i=1:30
%     plot3(NDcurve{i+30}(1,:),NDcurve{i+30}(2,:),NDcurve{i+30}(3,:),'r')
%     hold on
%     axis equal
% end
% hold on
% for i=1:30
%     plot3(NDcurve{i+60}(1,:),NDcurve{i+60}(2,:),NDcurve{i+60}(3,:),'g')
%     hold on
%     axis equal
% end
% for i=1:30
%     plot3(NDcurve{i+90}(1,:),NDcurve{i+90}(2,:),NDcurve{i+90}(3,:),'b')
%     hold on
%     axis equal
% end
Ind{1,1} = 42:49; %NasalAperture
Ind{2,1} = 50:58; %OrbitR
Ind{3,1} = 59:67; %OrbitL
Ind{4,1} = 68:73; %DentalArch
Ind{5,1} = 74:78; %Palate
Ind{6,1} = 79:95; %SagittalCL
Ind{7,1} = 96:103; %ForamenMagnumCL
Ind{8,1} = 104:110; %ZygomaticArchRCL
Ind{9,1} = 111:117; %ZygomaticArchLCL
Ind{10,1} = [118:125,132:133]; %CoronalSutureCL
Ind{11,1} = 126:131; %LambdoidCurve
Ind{12,1} = 134:209; %SL
for ii = 1:63
    for jj = 1:11
        U0{ii,jj} = fnplt(cscvn(U0_Points{ii}(:,Ind{jj,1})));
        for kk = 1:3
            U0{ii,jj} = fnplt(cscvn(U0{ii,jj}));
        end
    end
end
Dcurve=cell(1,63);
for i=1:63
    Dcurve{i}=U0{i,10};% sagittal curve
end
