N=length(NS);
G1=[];G2=[];G3=[];G4=[];
ctr1=1;ctr2=1;ctr3=1;ctr4=1;
for i=1:N
    if P(i)==1
        G1{ctr1}=NDcurve{i};
        ctr1=ctr1+1;
    elseif P(i)==2
        G2{ctr2}=NDcurve{i};
        ctr2=ctr2+1;
    elseif P(i)==3
        G3{ctr3}=NDcurve{i};
        ctr3=ctr3+1;
    else
        G4{ctr4}=NDcurve{i};
        ctr4=ctr4+1;
    end
end
[G1m]=meanshape(G1);
y1=FunctionalSurfaceplot(G1m,'r')
hold on
[G2m]=meanshape(G2);
y2=FunctionalSurfaceplot(G2m,'b:')
hold on
[G3m]=meanshape(G3);
y3=FunctionalSurfaceplot(G3m,'g:.')
hold on
[G4m]=meanshape(G4);
y4=FunctionalSurfaceplot(G4m,'k--')
grid on
axis equal
legend([y1,y2,y3,y4],'Group1','Group2','Group3','Group4')

