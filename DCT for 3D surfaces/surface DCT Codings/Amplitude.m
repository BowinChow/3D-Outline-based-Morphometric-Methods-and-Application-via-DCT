x=curve(1,:);
X = dct2(x);
i = 1;
while norm(X(1:i))/norm(X)<0.999
    i = i + 1;
end
figure
hold on
grid on
title('a')
index=linspace(1,i,i);
ylabel('Absolute value of amptitude'); 
xlabel('Order of harmonics');
plot(abs(X),'MarkerFaceColor',[1 0 0],'MarkerSize',3,'Marker','o',...
    'LineWidth',1.8,...
    'LineStyle',':',...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);


plot(index,abs(X(1:i)),'MarkerFaceColor',[0 0 1],'MarkerSize',4,'Marker','o',...
    'LineWidth',2,...
    'LineStyle','none',...
    'Color',[0 0 1])
max_n=i;
[XX,ind] = sort(abs(X(1:max_n)),'descend');
[XXX,ind] = sort(abs(X),'descend');
i = 1;
while norm(X(ind(1:i)))/norm(X)<0.995
    i = i + 1;
end
S=ind(1:i);

figure
hold on
grid on
title('b')
ylabel('Absolute value of amptitude'); 
xlabel('Order of harmonics');
index=linspace(1,i,i);
plot(abs(XX),'MarkerFaceColor',[1 0 0],'MarkerSize',3,'Marker','o',...
    'LineWidth',1.8,...
    'LineStyle',':',...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);


plot(index,abs(XX(1:i)),'MarkerFaceColor',[0 0 1],'MarkerSize',4,'Marker','o',...
    'LineWidth',2,...
    'LineStyle','none',...
    'Color',[0 0 1])


figure

ylabel('Absolute value of amptitude'); 
xlabel('Order of harmonics');
plot(abs(X),'MarkerFaceColor',[1 0 0],'MarkerSize',3,'Marker','o',...
    'LineWidth',1.8,...
    'LineStyle',':',...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);

hold on
grid on
title('c')
ylabel('Absolute value of amptitude'); 
xlabel('Order of harmonics');
plot(S,abs(XX(1:i)),'MarkerFaceColor',[0 0 1],'MarkerSize',4,'Marker','o',...
    'LineWidth',2,...
    'LineStyle','none',...
    'Color',[0 0 1])

