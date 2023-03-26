function [s,coef,index ,XX,X] = DCT_function( curve,Needed )
% This function is an alternative of MATLAB function: dct and idct;
% In MATLAB 2016b, we can use the built-in function: dct and idct to
% fit open curves, however, the dct function is deleted in MATLAB 2019a
% or later versions. So this function is effetive as the built-in function
% to fit curves;
%% The meaning of terms:
% curve---the specified coordinates of X,Y or Z direction,
% Such as the X-coordinates of a 3D curve;
% S---the coefficients gennerated in DCT;
% s---the transformed coordinates of input ones;
% Needed---the determined number of harmonic(usually determined by energy occupied or fitting error);
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
[XX,ind] = sort(abs(X),'descend');
i=1;
index=1;
while norm(X(ind(1:index)))/norm(X)<0.999
    index = index + 1;
end
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
end

