function [newCurve,bestPath] = findPath_GA(curve)
%FINDPATH_GA 此处显示有关此函数的摘要
%   此处显示详细说明
close all
clc
pts=curve{1};
tStart = tic; % Timer
ptsNum=size(pts,2);
maxGEN = 200;
popSize = 200; % GA group size
crossoverProbabilty = 0.8; %Prob of crossover
mutationProbabilty = 0.2; %Prob of mutation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gbest = Inf;
points=pts
% Calculate the distances
distances = calculateDistance(points);
% Each individual represents a ath
pop = zeros(popSize, ptsNum);
for i=1:popSize
    pop(i,:) = randperm(ptsNum);
end
offspring = zeros(popSize,ptsNum);
minPathes = zeros(maxGEN,1);
% GA
for  gen=1:maxGEN
    % Caculate the fitness
    [fval, sumDistance, minPath, maxPath] = fitness(distances, pop);
    % Roulette Selection
    tournamentSize=4;
    for k=1:popSize
        % crossover
        tourPopDistances=zeros( tournamentSize,1);
        for i=1:tournamentSize
            randomRow = randi(popSize);
            tourPopDistances(i,1) = sumDistance(randomRow,1);
        end
        % The best
        parent1  = min(tourPopDistances);
        [parent1X,parent1Y] = find(sumDistance==parent1,1, 'first');
        parent1Path = pop(parent1X(1,1),:);
        for i=1:tournamentSize
            randomRow = randi(popSize);
            tourPopDistances(i,1) = sumDistance(randomRow,1);
        end
        parent2  = min(tourPopDistances);
        [parent2X,parent2Y] = find(sumDistance==parent2,1, 'first');
        parent2Path = pop(parent2X(1,1),:);
        subPath = crossover(parent1Path, parent2Path, crossoverProbabilty);%交叉
        subPath = mutate(subPath, mutationProbabilty);%变异
        offspring(k,:) = subPath(1,:);
        minPathes(gen,1) = minPath;
    end
    fprintf('Iterations:%d   The length of shortest path:%.2fKM \n', gen,minPath);
    % update
    pop = offspring;
    if minPath < gbest
        gbest = minPath;
        [bestPath]=paint(points, pop, gbest, sumDistance,gen);
    end
end
figure
plot(minPathes,'g:','LineWidth',2);
title('GA best path in each generation');
% set(gca,'ytick',500:100:5000);
ylabel('The length of path');
xlabel('Iterations');
grid on
tEnd = toc(tStart);
fprintf('Time:%d Min  %f Sec.\n', floor(tEnd/60), rem(tEnd,60));
%%
figure
plot3(pts(1,bestPath),pts(2,bestPath),pts(3,bestPath),'o:', 'MarkerSize', 5, 'MarkerFaceColor', 'g','linewidth',2);
axis equal
grid on
for i = 1:size(pts,2)
    text(pts(1,i),pts(2,i),pts(3,i),['   ' num2str(i)]);
end
for ii=1:63
    newCurve{ii}=curve{ii}(:,bestPath);
end
end

