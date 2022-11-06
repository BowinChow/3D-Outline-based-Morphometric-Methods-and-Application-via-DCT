N=length(curve);
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
end
coefficients=[X Y Z];
for ii=1:N
 xx = idct2(X(ii,:));
 yy=idct2(Y(ii,:));
 zz=idct2(Z(ii,:));
 Curve{ii}=[xx;yy;zz];
end
 