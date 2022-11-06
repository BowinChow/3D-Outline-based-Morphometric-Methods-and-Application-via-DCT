dim=size(Dcurve{1},1);
if dim==3
    N=length(Dcurve);
    % Resampling curves with CSCVN function in MATLAB
    % To keep the dimensions of all curves are equal
    % TO some extend, points generated with CSCVN are with a kind of
    % homology, please see referrence attached in the function.
    for i=1:1
        n=1000;
        c{i}=Dcurve{i};
        pp=cscvn(c{i});
        piece=pp.breaks(end)/(n-1);
        x=0:piece:pp.breaks(end);
        NDcurve{i}=fnval(cscvn(c{i}),x);
    end
    x=[];
    y=[];
    z=[];
    coef=[];
    n1=[];
    n2=[];
    n3=[];
    m=input('please input the number of harmonic:');
    for i=1:1
        Z{i}=NDcurve{i}';
        figure
        [x{i},coef(i,1:m),n1(i)]=DCT_function(Z{i}(:,1),m);
        [y{i},coef(i,m+1:2*m),n2(i)]=DCT_function(Z{i}(:,2),m);
        [z{i},coef(i,2*m+1:3*m),n3(i)]=DCT_function(Z{i}(:,3),m);
        plot3(Z{i}(:,1),Z{i}(:,2),Z{i}(:,3),'r','linewidth',2)
        hold on
        plot3(x{i},y{i},z{i},'b--','linewidth',2)
        legend('original curve','fitted curve')
        grid on
        axis equal
        xlabel('X','fontsize',16)
        ylabel('Y','fontsize',16)
        zlabel('Z','fontsize',16)
    end
end
