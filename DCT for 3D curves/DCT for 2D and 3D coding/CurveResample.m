function [NDcurve] = CurveResample(Dcurve,num_points)
%     Resampling curves with CSCVN function in MATLAB
%     To keep the dimensions of all curves are equal
%     TO some extend, points generated with CSCVN are with a kind of
%     homology, please see referrence attached in the function.
N=length(Dcurve);
NDcurve=cell(1,N);
    for i=1:N
        n=num_points;
        c{i}=Dcurve{i};
        pp=cscvn(c{i});
        piece=pp.breaks(end)/(n-1);
        x=0:piece:pp.breaks(end);
        NDcurve{i}=fnval(cscvn(c{i}),x);
    end
end

