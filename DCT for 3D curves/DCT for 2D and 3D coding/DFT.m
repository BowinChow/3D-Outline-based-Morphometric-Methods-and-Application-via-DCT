Z=Dcurve{1};
N=length(Z);
C=zeros(N,1);
for j=1:N
    C(j)=complex(Z(1,j),Z(2,j));
end
X=fft(C,N);
 X(11:101)=complex(0,0);
T=ifft(X);
a=real(T);
b=imag(T);
plot(Z(1,:),Z(2,:),'b')
hold on
plot(a,b,'r')
axis equal

