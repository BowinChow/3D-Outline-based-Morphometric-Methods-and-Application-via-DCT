function [coef] = calCoef(label,coefficients)
coef=[];
G1=[];G2=[];G3=[];G4=[];G5=[];G6=[];
for ii=1:28
    if label(ii)==1
        G1=[G1; coefficients(ii,:) label(ii)];
    elseif label(ii)==2
        G2=[G2; coefficients(ii,:) label(ii)];
    elseif label(ii)==3
        G3=[G3; coefficients(ii,:) label(ii)];
    elseif label(ii)==4
        G4=[G4; coefficients(ii,:) label(ii)];
    elseif label(ii)==5
        G5=[G5; coefficients(ii,:) label(ii)];
    elseif label(ii)==6
        G6=[G6; coefficients(ii,:) label(ii)];
        
    end
end
coef=[G1; G2; G3; G4; G5; G6];

end

