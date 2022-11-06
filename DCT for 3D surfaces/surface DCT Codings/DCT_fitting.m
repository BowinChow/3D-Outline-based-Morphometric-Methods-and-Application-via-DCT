function [max_harmonic] = DCT_fitting(NDcurve,m)
N=length(NDcurve);
dim=size(NDcurve{1},1);
if dim==3
    x=[];
    y=[];
    z=[];
    coef=[];
    n1=[];
    n2=[];
    n3=[];
    curve=[];
    for i=1:N
        Z{i}=NDcurve{i}';
%         figure
        %         [x{i},coef(i,1:m),n1(i)]=dct_open(Z{i}(:,1),m);
        %         [y{i},coef(i,m+1:2*m),n2(i)]=dct_open(Z{i}(:,2),m);
        %         [z{i},coef(i,2*m+1:3*m),n3(i)]=dct_open(Z{i}(:,3),m);
        [x{i},coef(i,1:m),n1(i)]=dct_open(Z{i}(:,1),m);
        [y{i},coef(i,m+1:2*m),n2(i)]=dct_open(Z{i}(:,2),m);
        [z{i},coef(i,2*m+1:3*m),n3(i)]=dct_open(Z{i}(:,3),m);
        plot3(Z{i}(:,1),Z{i}(:,2),Z{i}(:,3),'ro')
        
        hold on
        plot3(x{i},y{i},z{i},'bo')
        legend('Originsl surface','Fitted surface')
        grid on
        axis equal
        xlabel('X','fontsize',16)
        ylabel('Y','fontsize',16)
        zlabel('Z','fontsize',16)
        %         % Drawing the fitting results in different axis
        %         P{i}=NDcurve{i}';
        %         figure
        %         subplot(131)
        %         plot(P{i}(:,1),'r','linewidth',2)
        %         hold on
        %         plot(x{i},'b--','linewidth',2)
        %         title('X-Coordinates')
        %         legend('Original curve','Fitted curve')
        %         subplot(132)
        %         plot(P{i}(:,2),'g','linewidth',2)
        %         hold on
        %         plot(y{i},'b--','linewidth',2)
        %         title('Y-Coordinates')
        %         legend('Original curve','Fitted curve')
        %         subplot(133)
        %         plot(P{i}(:,3),'k','linewidth',2)
        %         hold on
        %         plot(z{i},'b--','linewidth',2)
        %         title('Z-Coordinates')
        %         legend('Original curve','Fitted curve')
        %
        max_harmonic=max(max([n1;n2;n3]));
        curve{i}(1,:)=x{i};
        curve{i}(2,:)=y{i};
        curve{i}(3,:)=z{i};
    end
end

