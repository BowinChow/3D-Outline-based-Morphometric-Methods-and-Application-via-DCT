L=[];
B=[];
R=[];
U=[];
N=length(P);
for i=1:N
    if P(i)==1
        L=[L;coefficients(i,:) P(i)];
    elseif P(i)==2
        B=[B;coefficients(i,:) P(i) ];
    elseif P(i)==3
        R=[R;coefficients(i,:) P(i) ];
    else
        U=[U;coefficients(i,:) P(i) ];
    end
    
end
Var=[L;B;R;U];
