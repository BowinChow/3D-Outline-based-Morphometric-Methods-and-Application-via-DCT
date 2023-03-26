% curve=NS1;
for i=1:length(curve)
    temp=[];
    for k=1:length(curve{i})
        [~,a]=find(bestPath==k);
        temp=[temp curve_fitted{i}(:,a)];
    end
    FS{i}=temp;
end
SurfaceReconstructionS2(curve{1},FS{1});
