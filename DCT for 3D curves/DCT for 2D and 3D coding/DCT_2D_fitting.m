 %% 2D fitting
    N=length(Dcurve);
     for i=1:N
        n=1000;
        c{i}=Dcurve{i};
        pp=cscvn(c{i});
        piece=pp.breaks(end)/(n-1);
        x=0:piece:pp.breaks(end);
        NDcurve{i}=fnval(cscvn(c{i}),x);
    end
%     for i=1:N
%         Tcurve{i}=S{i}';
%         x_mean(i,:)=Tcurve{i}(1,:);
%         y_mean(i,:)=Tcurve{i}(2,:);
%         axis equal
%     end
%     x_a=mean(x_mean);
%     y_a=mean(y_mean);
%     ave=[x_a;y_a];
%     for i=1:N
%         figure
%         [~,z{i}]=procrustes(ave',Tcurve{i}','scaling',true);
%         plot(z{i}(:,1),z{i}(:,2),'r')
%         hold on
%         plot(ave(1,:),ave(2,:),'b')
%         axis equal
%         
%     end
    x=[];
    y=[];
    m=10;
    for i=1:N
        P{i}=NDcurve{i}';
        figure
        [x{i},coef(i,1:m),n1(i)]=dct_open(P{i}(:,1),m);
        [y{i},coef(i,m+1:2*m),n2(i)]=dct_open(P{i}(:,2),m);
        
        plot(P{i}(:,1),P{i}(:,2),'r','linewidth',2)
        hold on
        plot(x{i},y{i},'b--','linewidth',2)
        legend('original curve','fitted curve')
        axis equal
        
    end
    for i=1:N
        figure
        plot(z{i}(:,1),z{i}(:,2),'r')
        hold on
        plot(ave(1,:),ave(2,:),'b');
    end
    % for m=1:30
    %     for i=1:90
    %         P{i}=z{i};
    %
    %         [x{m,i},coef{m}(i,1:m),n1(m,i)]=dct_open(P{i}(:,1),m);
    %         [y{m,i},coef{m}(i,m+1:2*m),n2(m,i)]=dct_open(P{i}(:,2),m);
    %
    %         %     plot(P{i}(:,1),P{i}(:,2),'r','linewidth',2)
    %         %     hold on
    %         %     plot(x{i},y{i},'b--','linewidth',2)
    %         %     legend('original curve','fitted curve')
    %         %     axis equal
    %         dis(m,i)=norm(P{i}-[x{m,i},y{m,i}]);
    %     end
    % end
    % plot(1:40,dis)
    % for i=1:N
    %     figure
    %     subplot(121)
    %     plot(P{i}(:,1),'r','linewidth',2)
    %     hold on
    %     plot(x{i},'b--','linewidth',2)
    %     title('X-Coordinates')
    %     legend('original curve','fitted curve')
    %     subplot(122)
    %     plot(P{i}(:,2),'g','linewidth',2)
    %     hold on
    %     plot(y{i},'b--','linewidth',2)
    %     legend('original curve','fitted curve')
    %     title('Y-Coordinates')
    % end