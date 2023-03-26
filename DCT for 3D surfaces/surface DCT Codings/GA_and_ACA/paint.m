function [  bestPopPath ] = paint( points, pop, minPath, totalDistances,gen)
gNumber=gen;
[row, length] = size(points);
if row==2
    xDots = points(1,:);
    yDots = points(2,:);
    %figure(1);
    title('TSP-GA');
    plot(xDots,yDots, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
    xlabel('X');
    ylabel('Y');
    axis equal
    hold on
    [minPathX,~] = find(totalDistances==minPath,1, 'first');
    bestPopPath = pop(minPathX, :);
    bestX = zeros(1,length);
    bestY = zeros(1,length);
    for j=1:length
        bestX(1,j) = points(1,bestPopPath(1,j));
        bestY(1,j) = points(2,bestPopPath(1,j));
    end
    title('GA TSP');
    plot(bestX(1,:),bestY(1,:), 'r:', 'LineWidth', 2);
    legend('Points', 'The best path');
    axis equal
    grid on
     %text(5,0,sprintf('Iterations: %d Length of path: %.2f',gNumber, minPath),'FontSize',10);
    drawnow
    hold off
else
    xDots = points(1,:);
    yDots = points(2,:);
    zDots = points(3,:);
    %figure(1);
    title('TSP-GA');
    plot3(xDots,yDots, zDots,'go', 'MarkerSize', 6, 'MarkerFaceColor', 'g');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    axis equal
    hold on
    [minPathX,~] = find(totalDistances==minPath,1, 'first');
    bestPopPath = pop(minPathX, :);
    bestX = zeros(1,length);
    bestY = zeros(1,length);
    bestZ = zeros(1,length);
    for j=1:length
        bestX(1,j) = points(1,bestPopPath(1,j));
        bestY(1,j) = points(2,bestPopPath(1,j));
        bestZ(1,j) = points(3,bestPopPath(1,j));
    end
    title('GA_TSP');
    plot3(bestX(1,:),bestY(1,:),bestZ(1,:), 'b:', 'LineWidth', 2);
    legend('Points', 'The best path');
    axis equal
    grid on
    %text(5,0,sprintf('Iterations: %d Length of path: %.2f',gNumber, minPath),'FontSize',10);
    drawnow
    hold off
end

end