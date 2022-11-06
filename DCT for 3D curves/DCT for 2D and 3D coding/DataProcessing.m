clear;close all;clc;
filename = 'AllPointsData63.xlsx';
sheet = 1;
xlRange = 'B1:GH209';
Data = xlsread(filename,sheet,xlRange);
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
N_Groups = size(Data,2)/3;
for ii = 1:N_Groups
    U_Points{ii,1} = Data(:,3*(ii-1)+1:3*ii)';
    x(ii,:)=U_Points{ii,1}(1,:);
    y(ii,:)=U_Points{ii,1}(2,:);
    z(ii,:)=U_Points{ii,1}(3,:);
end
xmean=mean(x);
ymean=mean(y);
zmean=mean(z);
ave=[xmean;ymean;zmean]; % Mean shape of all 63 skulls;
scatter3(xmean,ymean,zmean)
axis equal
%% Aligning to the first shape and smoothing the curves
for ii = 1:N_Groups
    [~,Z{ii,1}]=procrustes(U_Points{end,1}',U_Points{ii,1}');
    U_Points{ii,1}=Z{ii,1}';
    for jj = 1:11
        U0{ii,jj} = fnplt(cscvn(U_Points{ii,1}(:,Ind{jj,1})));
        for kk = 1:3
            U0{ii,jj} = fnplt(cscvn(U0{ii,jj}));
        end
    end
end
save('ProcrustesSkull.mat','U_Points','U0')
%% Abstracting curves on the 3D skull aligned with GPA
Dcurve=cell(1,63);
for i=1:63
    Dcurve{i}=U0{i,11};% sagittal curve
end
%% Visualization of different kinds of diagnoises (abstracted curves)
% %% figures
% for ii = 1:63 %N_Groups
%     figure('position',[100 50 1000 580])
%     hold on
%     axis equal
%     grid minor
%     view([1 -1 1])
%     if P(ii)==1
%         plot3(U_Points{ii,1}(1,:),U_Points{ii,1}(2,:),U_Points{ii,1}(3,:),'r.','markersize',10)
%         for jj = 1:11 %6 10 11
%             plot3(U0{ii,jj}(1,:),U0{ii,jj}(2,:),U0{ii,jj}(3,:),'r-')
%         end
%         hold on
%     elseif P(ii)==2
%         plot3(U_Points{ii,1}(1,:),U_Points{ii,1}(2,:),U_Points{ii,1}(3,:),'b.','markersize',10)
%         for jj = 1:11 %6 10 11
%             plot3(U0{ii,jj}(1,:),U0{ii,jj}(2,:),U0{ii,jj}(3,:),'b-')
%         end
%         hold on
%     elseif P(ii)==3
%         plot3(U_Points{ii,1}(1,:),U_Points{ii,1}(2,:),U_Points{ii,1}(3,:),'g.','markersize',10)
%         for jj = 1:11 %6 10 11
%             plot3(U0{ii,jj}(1,:),U0{ii,jj}(2,:),U0{ii,jj}(3,:),'g-')
%         end
%         hold on
%     else
%         plot3(U_Points{ii,1}(1,:),U_Points{ii,1}(2,:),U_Points{ii,1}(3,:),'k.','markersize',10)
%         for jj = 1:11 %6 10 11
%             plot3(U0{ii,jj}(1,:),U0{ii,jj}(2,:),U0{ii,jj}(3,:),'k-')
%         end
%     end
% end


%     for i=1:length(Dcurve)
%         if P(i)==1
%             plot3(Dcurve{i}(1,:),Dcurve{i}(2,:),Dcurve{i}(3,:),'r','linewidth',2);
%             hold on
%         elseif P(i)==2
%             plot3(Dcurve{i}(1,:),Dcurve{i}(2,:),Dcurve{i}(3,:),'b','linewidth',2);
%             hold on
%         elseif P(i)==3
%             plot3(Dcurve{i}(1,:),Dcurve{i}(2,:),Dcurve{i}(3,:),'g','linewidth',2);
%             hold on
%         else
%             plot3(Dcurve{i}(1,:),Dcurve{i}(2,:),Dcurve{i}(3,:),'k','linewidth',2);
%             hold on
%         end
%     end
%     axis equal
%     figure
%     a=[1 2 3 63];
%     c1=rand(4,3);
%     for i=1:4
%         Z{a(i)}=Dcurve{a(i)}';
%         plot3(Z{a(i)}(:,1),Z{a(i)}(:,2),Z{a(i)}(:,3),'color',c1(i,:),'linewidth',2);
%         hold on
%         grid on
%         axis equal
%         xlabel('X','fontsize',16)
%         ylabel('Y','fontsize',16)
%         zlabel('Z','fontsize',16)
%
%     end






