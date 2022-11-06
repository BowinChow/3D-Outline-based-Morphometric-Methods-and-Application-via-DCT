figure

x=curve(1,:);
X = dct2(x);
subplot(311)
hold on
grid on
title('X-coordinate')
index=linspace(1,i,i);
plot(abs(X),'MarkerFaceColor',[1 0 0],'MarkerSize',3,'Marker','o',...
    'LineWidth',1.8,...
    'LineStyle',':',...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);
x=curve(2,:);
X = dct2(x);
subplot(312)
hold on
grid on
title('Y-coordinate')
ylabel('Absolute value of amptitude'); 

index=linspace(1,i,i);
plot(abs(X),'MarkerFaceColor',[1 0 0],'MarkerSize',3,'Marker','o',...
    'LineWidth',1.8,...
    'LineStyle',':',...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);
x=curve(3,:);
X = dct2(x);
subplot(313)
hold on
grid on
title('Z-coordinate')
xlabel('Order of harmonics'); 
index=linspace(1,i,i);
plot(abs(X),'MarkerFaceColor',[1 0 0],'MarkerSize',3,'Marker','o',...
    'LineWidth',1.8,...
    'LineStyle',':',...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);
%%
figure

x=curve(1,:);
X =sort(abs(dct2(x)),'descend'); 
subplot(311)
hold on
grid on
title('X-coordinate')
index=linspace(1,i,i);
plot(abs(X),'MarkerFaceColor',[1 0 0],'MarkerSize',3,'Marker','o',...
    'LineWidth',1.8,...
    'LineStyle',':',...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);
x=curve(2,:);
X =sort(abs(dct2(x)),'descend'); 
subplot(312)
hold on
grid on
title('Y-coordinate')
ylabel('Absolute value of amptitude'); 
index=linspace(1,i,i);
plot(abs(X),'MarkerFaceColor',[1 0 0],'MarkerSize',3,'Marker','o',...
    'LineWidth',1.8,...
    'LineStyle',':',...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);
x=curve(3,:);
X =sort(abs(dct2(x)),'descend'); 
subplot(313)
hold on
grid on
title('Z-coordinate')
xlabel('Order of harmonics');
index=linspace(1,i,i);
plot(abs(X),'MarkerFaceColor',[1 0 0],'MarkerSize',3,'Marker','o',...
    'LineWidth',1.8,...
    'LineStyle',':',...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);


