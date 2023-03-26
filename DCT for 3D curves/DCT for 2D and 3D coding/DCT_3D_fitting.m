% Dcurve=Creat_3DCurves(4);
[NDcurve] = CurveResample(Dcurve,1000);
[dis] = PlotError(50,NDcurve);
[coefficients,max_n]=DCT_fitting(NDcurve,30);
% suture: sagittal-12,lambdoid-6,coronal-6;
% spiral-30;
% Drawing the fitting results in different axis
    % for i=1:1
    %     P{i}=NDcurve{i}';
    %     figure
    %     subplot(131)
    %     plot(P{i}(:,1),'r','linewidth',2)
    %     hold on
    %     plot(x{i},'b--','linewidth',2)
    %     title('X-Coordinates')
    %     legend('original curve','fitted curve')
    %     subplot(132)
    %     plot(P{i}(:,2),'g','linewidth',2)
    %     hold on
    %     plot(y{i},'b--','linewidth',2)
    %     title('Y-Coordinates')
    %     legend('original curve','fitted curve')
    %     subplot(133)
    %     plot(P{i}(:,3),'k','linewidth',2)
    %     hold on
    %     plot(z{i},'b--','linewidth',2)
    %     title('Z-Coordinates')
    %     legend('original curve','fitted curve')
    % end

P(1:30,1)=ones(1,30);

P(31:60,1)=2*ones(1,30);
P(61:90,1)=3*ones(1,30);
P(91:120,1)=4*ones(1,30);