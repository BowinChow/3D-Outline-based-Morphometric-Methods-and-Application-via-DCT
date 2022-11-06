function [Nmax1,Nmax2,frequency] = Frequency(curve)
dbstop if error
XF=abs(dct2(curve(1,:)));
YF=abs(dct2(curve(2,:)));
ZF=abs(dct2(curve(3,:)));
figure
subplot(311)
plot(XF,'r:','linewidth',2)

hold on
grid on
title('X-Amplitude')
subplot(312)
plot(YF,'r:','linewidth',2)
hold on
grid on
title('Y-Amplitude')
subplot(313)
plot(ZF,'r:','linewidth',2)
hold on
grid on
title('Z-Amplitude')
%%
XF1=sort(XF,'descend');
YF1=sort(YF,'descend');
ZF1=sort(ZF,'descend');
figure
subplot(311)
plot(XF1,'r:','linewidth',2)

hold on
grid on
title('X-Amplitude')
subplot(312)
plot(YF1,'r:','linewidth',2)
hold on
grid on
title('Y-Amplitude')
subplot(313)
plot(ZF1,'r:','linewidth',2)
hold on
grid on
title('Z-Amplitude')
frequency=[XF;YF;ZF];
grid on
n1=1;
n2=1;
n3=1;
ns1=1;
ns2=1;
ns3=1;
while norm(XF(1:n1))/norm(XF)<0.99
    n1=n1+1;
end
while norm(YF(1:n2))/norm(YF)<0.99
    n2=n2+1;
end
while norm(ZF(1:n3))/norm(ZF)<0.99
    n3=n3+1;
end
Nmax1=max([n1 n2 n3]);
while norm(XF1(1:ns1))/norm(XF1)<0.99
    ns1=ns1+1;
end
while norm(YF1(1:ns2))/norm(YF1)<0.99
    ns2=ns2+1;
end
while norm(ZF1(1:ns3))/norm(ZF1)<0.99
    ns3=ns3+1;
end
Nmax2=max([ns1 ns2 ns3]);
end

