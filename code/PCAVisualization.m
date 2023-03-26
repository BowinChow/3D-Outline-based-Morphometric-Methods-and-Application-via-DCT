function PCAVisualization(data,mode,species)
    X = data;                 % n = 150, m = 4
    meanX = ones(size(X,1), 1) * mean(X);  % ���Ļ�����
    
    centredX = X - meanX;
    
    C = cov(centredX);	        % ֱ�ӵ���covֱ�Ӽ���Э������󼴿�
    
    [W, Lambda] = eig(C);       % W������������ɵľ���4��4����Lambda������ֵ��ɵĶԽǾ���
    ev = (diag(Lambda))';		% ��ȡ����ֵ
    ev = ev(:, end:-1:1);		    % eig�����������ֵ������ģ������ֶ�����Wͬ��
    
    ev_normal = ev/sum(ev)
    
    
    figure
    x=1:size(ev')
    plot(1:size(ev'),ev_normal,'ro:','linewidth',2);
    axis equal 
    grid on
    
   %% start plot PCA
    W = W(:, end:-1:1);
    sum(W.*W, 1)             % ������֤ÿ������������Ԫ�ص�ƽ���;�Ϊ
    Wr = W(:, 1:2);             % ��ȡǰ�������ɷֵ���������
    Tr = centredX * Wr;         %  ������ռ�����ݵ�
    figure;
    scatter(Tr(:,1), Tr(:,2), 180, categorical(species), '.');
    colormap(winter);
    xlabel('PC 1');
    ylabel('PC 2');
end

