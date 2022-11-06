
N=length(curve);
S=[];
c=[];
s=zeros(1,N);
for k=0:N-1
    C=0;
    if k==0
        for i=0:N-1
            C=C+curve(i+1)*cos(pi/(2*N)*(2*i+1)*k);
        end
        S(1)=sqrt(1/N)*C;
    else
        for i=0:N-1
            C=C+curve(i+1)*cos(pi/(2*N)*(2*i+1)*k);
        end
        S(k+1)=sqrt(2/N)*C;
    end
end
for k=0:N-1
    if k==0
        c(k+1)=sqrt(1/N);
    else
        c(k+1)=sqrt(2/N);
    end
end
X=S;
Needed=12;
[XX,ind] = sort(abs(X),'descend');
% while norm(X(ind(1:Needed)))/norm(X)<0.999
%     Needed = Needed + 1;
% end
coef=X(ind(1:Needed));
X(ind(Needed+1:end)) = 0;
for i=0:N-1
    C=0;
    for k=0:N-1
        C=C+c(k+1)*X(k+1)*cos(pi/(2*N)*(2*i+1)*k);
    end
    s(i+1)=C;
end
plot(curve,'r')
hold on 
plot(s,'b')
