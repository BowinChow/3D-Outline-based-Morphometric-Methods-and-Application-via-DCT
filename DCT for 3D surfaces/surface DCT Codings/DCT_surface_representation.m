%Selecting the first n number of harmonics to have a total energy over 99.9% 
clc
close all
N=length(newCurve{1});
[max_n]=DCT_fitting(newCurve,N);
[coefficients,curve_fitted,ind] = DCT_Surface_Union(newCurve,max_n);
% [res,res_val,res_sort] = calResidual(newCurve,curve_fitted);

for i=1:length(curve)
    temp=[];
    for k=1:length(curve{i})
        [~,a]=find(bestPath==k);
        temp=[temp curve_fitted{i}(:,a)];
    end
    FS{i}=temp;
end

 %SurfaceReconstruction_simulated(curve{res_sort(1)},FS{res_sort(1)});
 %SurfaceReconstruction_simulated(curve{res_sort(end)},FS{res_sort(end)});
% coefficients(1:30,end+1)=1;coefficients(31:60,end)=2;coefficients(61:90,end)=3;coefficients(91:120,end)=4;
SurfaceReconstructionS2(curve{res_sort(1)},FS{res_sort(1)});
SurfaceReconstructionS2(curve{res_sort(end)},FS{res_sort(end)});
k=3;
value=Var(k,1);
for i=1:63
    if(coefficients(i,1)==value)
      break;
    end
end
    
view([1,-1,1])
% i=17;
P=U0_Points{i}';
k = boundary(P);
hold on
y3=trisurf(k,P(:,1),P(:,2),P(:,3),'facecolor',[1 0.87 0.678],'FaceAlpha',0.4,'linestyle',':');
hold on
[y1,y2]=SurfaceReconstructionS1(curve{i},curve_fitted{i});
hold on
% plot3(S1{i}(1,:),S1{i}(2,:),S1{i}(3,:),'k>','markerfacecolor','k');
% hold on
% y2=plot3(S2{63}(1,:),S2{63}(2,:),S2{63}(3,:),'bo','markerfacecolor','b');
  legend([y1,y2,y3],'original surface','fitted surface','3D skull ')     
axis equal
