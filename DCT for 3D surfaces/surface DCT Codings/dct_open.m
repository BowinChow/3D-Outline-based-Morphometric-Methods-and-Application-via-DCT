function [xx ,coef,i] = dct_open( x,Needed)
 X = dct2(x);
 i = 1;
 while norm(X(1:i))/norm(X)<0.999
     i = i + 1;
end
 coef=X(1:Needed); X(Needed+1:end) = 0;
 xx = idct2(X);
%X = dct2(x);
%[XX,ind] = sort(abs(X),'descend');
%i = 1;

%while norm(X(ind(1:i)))/norm(X)<0.999
 %   i = i + 1;
%end

%coef=X(ind(1:Needed));

%X(ind(Needed+1:end)) = 0;
%xx = idct2(X);
end
