function [ind,max_n]=surfacePlot(newCurve,curve,bestPath)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
N=length(newCurve{1});
[~,max_n]=DCT_fitting(newCurve,N);
[coefficients,curve_fitted,ind] = DCT_Surface_Union(newCurve,max_n);
for i=1:length(curve)
    temp=[];
    for k=1:length(curve{i})
        [~,a]=find(bestPath==k);
        temp=[temp curve_fitted{i}(:,a)];
    end
    FS{i}=temp;
end
SurfaceReconstructionS1(curve{1},FS{1});
end

