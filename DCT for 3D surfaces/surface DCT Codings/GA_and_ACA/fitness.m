function [ fitnessvar, sumDistances,minPath, maxPath ] = fitness( distances, pop )
% Calculate the fitness of groups
[popSize, col] = size(pop);
sumDistances = zeros(popSize,1);
fitnessvar = zeros(popSize,1);
for i=1:popSize
    for j=1:col-1
        sumDistances(i) = sumDistances(i) + distances(pop(i,j),pop(i,j+1));
    end
end
minPath = min(sumDistances);
maxPath = max(sumDistances);
for i=1:length(sumDistances)
    fitnessvar(i,1)=(maxPath - sumDistances(i,1)+0.000001) / (maxPath-minPath+0.00000001);
end
end