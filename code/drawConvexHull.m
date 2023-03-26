function y =  drawConvexHull(data,alpha,colorStr,strLineColor)
dt1 = delaunayTriangulation(data(:,1),data(:,2));
k = convexHull(dt1);

faceColor = Hex2RGB(colorStr);
lineColor =  Hex2RGB(strLineColor);
y = fill(data(k,1),data(k,2),faceColor,'facealpha',alpha,'edgecolor',lineColor);
hold on 
plot(data(:,1),data(:,2),'.','markersize',20,'color',faceColor/2)
hold on
axis equal
grid on
end

