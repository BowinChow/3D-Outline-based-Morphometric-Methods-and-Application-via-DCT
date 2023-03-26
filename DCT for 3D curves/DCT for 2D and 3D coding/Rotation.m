function [Rotation,Translation,Scaling] = Rotation(t)
N=length(t);
 theta=rand(1,1)*pi;
    beta=rand(1,1)*pi;
    gamma=rand(1,1)*pi;
    T(1,:)= rand(1,1)*ones(1,N);
    T(2,:)= rand(1,1)*ones(1,N);
    T(3,:)= rand(1,1)*ones(1,N);
    Rz=[cos(theta) -sin(theta) 0;
        sin(theta) cos(theta) 0;
        0 0 1];
    Rx=[1 0 0;0 cos(beta) -sin(beta);0 sin(beta) cos(beta)];
    Ry=[cos(gamma) 0 sin(gamma);0 1 0;-sin(gamma) 0 cos(gamma)];
    Rotation=Rx*Ry*Rz;
    Translation=T;
    Scaling=rand(1,1);
end

