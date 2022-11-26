function errorEllipse(datamatrix,p)
%print 2-demension confidence ellipse
%In:n¡Á2 matrix, confidence probability p

data = datamatrix;
covariance = cov(data);
[eigenvec,eigenval] = eig(covariance);

[sortEigenval,index] = sort(diag(eigenval),'descend');
sortEigenvec = eigenvec(:,index);

largestEigenval = sortEigenval(1);
smallestEigenval = sortEigenval(end); %find the minimum eigenvalue
largestEigenvec = sortEigenvec(:,1); %find the maximum eigenvector

angle = atan2(largestEigenvec(2), largestEigenvec(1)); %calculate the angle between x-axis and the maximum eigenvector, [-pi,pi]

if(angle < 0) 
    angle = angle + 2*pi;
end

avg = mean(data); %calculate the mean of two columns of data

%configure the parameters of the confidence ellipse
chisquareVal = sqrt(chi2inv(p,2)); %chi-square value
thetaGrid = linspace(0,2*pi); 
phi = angle; %rotation angle
X0=avg(1);
Y0=avg(2); 
a=chisquareVal*sqrt(largestEigenval); %the wheelbase length
b=chisquareVal*sqrt(smallestEigenval);

ellipseXR = a*cos( thetaGrid ); %onto rectangular axis
ellipseYR = b*sin( thetaGrid );

R = [ cos(phi) sin(phi); -sin(phi) cos(phi) ]; %rotation matrix

rEllipse = [ellipseXR;ellipseYR]' * R; %rotation
 fill(rEllipse(:,1) + X0,rEllipse(:,2) + Y0,'m','facealpha',0.3,'edgecolor','y');
 hold on
 plot(data(:,1), data(:,2), 'ro');
axis square
grid on
axis equal

end
