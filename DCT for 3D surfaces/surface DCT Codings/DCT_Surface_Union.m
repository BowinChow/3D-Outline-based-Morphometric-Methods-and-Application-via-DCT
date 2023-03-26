function [coefficients,curve_fitted,ind] = DCT_Surface_Union(curve,n)
N=length(curve);
ind=[];
x=[];
y=[];
z=[];
X=[];
Y=[];
Z=[];
for i=1:N
    Sx=[];
    Sy=[];
    Sz=[];
    x(i,:)=curve{i}(1,:);
    y(i,:)=curve{i}(2,:);
    z(i,:)=curve{i}(3,:);
    X(i,:)= dct2(x(i,:));
    Y(i,:)=dct2(y(i,:));
    Z(i,:)=dct2(z(i,:));
    Sx=CalHarmonics(X(i,1:n));
    Sy=CalHarmonics(Y(i,1:n));
    Sz=CalHarmonics(Z(i,1:n));
    S{i}=union(union(Sx,Sy),Sz);
    ind=union(ind,S{i});
end
Index=1:length(curve{1});
index_set=setdiff(Index,ind);
XX=[];
YY=[];
ZZ=[];
for i=1:N
    XX(i,:)=X(i,:);
    X(i,index_set)=0;
    YY(i,:)=Y(i,:);
    Y(i,index_set)=0;
    ZZ(i,:)=Z(i,:);
    Z(i,index_set)=0;
    curve_fitted{i}(1,:)=idct2(X(i,:));
    curve_fitted{i}(2,:)=idct2(Y(i,:));
    curve_fitted{i}(3,:)=idct2(Z(i,:));
  %  figure
 %   plot3( curve_fitted{i}(1,:), curve_fitted{i}(2,:), curve_fitted{i}(3,:),'ro');
 %   hold on
   % plot3(curve{i}(1,:),curve{i}(2,:),curve{i}(3,:),'bo')
  %  axis equal 
  
%  grid on
   % legend('Fitted','Original')
%     SurfaceReconstructionS1(curve{i},curve_fitted{i})
%     SurfaceReconstructionS1(curve{i},curve_fitted{i})

%     axis equal
%     grid on
%     xlabel('X')
%     ylabel('Y')
%     zlabel('Z')
end
coefficients=[XX(:,ind) YY(:,ind) ZZ(:,ind)];

