function [dis] = PlotError(M,NDcurve)
% M       -> The defined harmonic
% N       -> Number of curves
% NDcurve -> Curves need to be fitted with DCT
N=length(NDcurve);
Z=cell(1,N);
x=[];
y=[];
z=[];
coef=[];
dis=[];
for m=1:M
    for i=1:N
        Z{i}=NDcurve{i}';
        [x{m,i},coef{m}(i,1:m),n1(m,i)]=dct_open(Z{i}(:,1),m);
        [y{m,i},coef{m}(i,m+1:2*m),n2(m,i)]=dct_open(Z{i}(:,2),m);
        [z{m,i},coef{m}(i,2*m+1:3*m),n3(m,i)]=dct_open(Z{i}(:,3),m);
        %                 dis(m,i)=norm(Z{i}-[x{m,i},y{m,i},z{m,i}])/length(NDcurve{1});
        %         dis(m,i)=norm(Z{i}-[x{m,i},y{m,i},z{m,i}]);
        dis(m,i)=sum(sum((Z{i}-[x{m,i},y{m,i},z{m,i}])'*(Z{i}-[x{m,i},y{m,i},z{m,i}])))/length(NDcurve{1});
    end
    clear coef n1 n2 n3
end
for i=1:1
    figure(i)
    c = Hex2RGB('#FFA1C4');
    
    plot(dis(:,i),':','color',c,'linewidth',2);
%     axis equal
    grid on
    legend('Error')
end

