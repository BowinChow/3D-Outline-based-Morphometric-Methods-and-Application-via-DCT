clc
close all
pst=curve{1};
C=pst';
n=size(C,1);  %n--the num of points
D=zeros(n,n); %D--initialize the distance matrix
for i=1:n
    for j=1:n
        if i~=j
            D(i,j)=((C(i,1)-C(j,1))^2+(C(i,2)-C(j,2))^2+(C(i,3)-C(j,3))^2)^0.5; %Caculate the distance betwwen two points
        else
            D(i,j)=0;   %i=j, distance=0£»
        end
    end
end
%%==================The process of ACA======================================================
%%============== STEP1 Initialize the PARAs in ACA==============
iter_max=100;   % Maximum Iterrations
m=10;           % The number of ants
Alpha=1;        % Parameters characterizing the importance of pheromones
Beta=5;         % Parameters characterizing the importance of heuristic factors
Rho=0.9;        % Pheromone evaporation factor
Q=20;           % Pheromone increase intensity factor
Eta=1./D;          % Eta is the visibility factor, set here as the reciprocal of the distance
Tau=ones(n,n);     % Tau is the pheromone matrix, initialized to 1
Tabu=zeros(m,n);   % Save and record the generation of paths
nC=1;              % Iteration Counter
R_best=zeros(iter_max,n);   %The shortest route for each generation, the maximum number of iterations of the behavior, and the number of points
L_best=inf.*ones(iter_max,1);%%The length of the shortest route for each generation, inf is infinite
L_ave=zeros(iter_max,1);     % Average route length by generation

%%============== STEP 2 Place m ants on the city==============
while nC<=iter_max    %One of the stopping conditions: reaching the maximum number of iterations
    Randpos=[];
    for i=1:(ceil(m/n))
        Randpos=[Randpos,randperm(n)];
    end
    Tabu(:,1)=(Randpos(1,1:m))';
    
    %% ============== STEP 3 m ants choose the next city according to the probability function and complete their respective peregrinations==============
    for j=2:n
        for  i=1:m
            visited=Tabu(i,1:(j-1));
            J=zeros(1,(n-j+1));
            P=J;
            Jc=1;
            
            for k=1:n
                if  length(find(visited==k))==0
                    J(Jc)=k;
                    Jc=Jc+1;
                end
            end
            
            for k=1:length(J)
                P(k)=(Tau(visited(end),J(k))^Alpha)*(Eta(visited(end),J(k))^Beta); %The numerator in the probability formula
            end
            P=P/(sum(P));
            Pcum=cumsum(P);
            Select=find(Pcum>=rand);
            if  isempty(Select)
                Tabu(i,j)=round(1+(n-1)*rand);
            else
                next_visit=J(Select(1));
                Tabu(i,j)=next_visit;
            end
        end
    end
    
    if nC>=2;Tabu(1,:)=R_best(nC-1,:);end
    
    %% ==============STEP 4 Record the best route for this iteration==============
    L=zeros(m,1);
    for i=1:m;
        R=Tabu(i,:);
        for j=1:(n-1)
            L(i)=L(i)+D(R(j),R(j+1));
        end
        L(i)=L(i)+D(R(1),R(n));
    end
    L_best(nC)=min(L);
    pos=find(L==L_best(nC));
    R_best(nC,:)=Tabu(pos(1),:);
    L_ave(nC)=mean(L);
    % Shortest_Route=[Shortest_Route Shortest_Route(1)];
    plot3([C( R_best(nC,:),1)],[C( R_best(nC,:),2)],[C( R_best(nC,:),3)],'o:', 'MarkerSize', 5, 'MarkerFaceColor', 'g','linewidth',2);
    view(50,-10);
     grid on
    drawnow
   
    %Find the average distance of the kth iteration
    nC=nC+1;
    
    %% ==============STEP5 Ant ==============
    Delta_Tau=zeros(n,n);
    for i=1:m
        for j=1:(n-1)
            Delta_Tau(Tabu(i,j),Tabu(i,j+1))=Delta_Tau(Tabu(i,j),Tabu(i,j+1))+Q/L(i);
        end
        Delta_Tau(Tabu(i,n),Tabu(i,1))=Delta_Tau(Tabu(i,n),Tabu(i,1))+Q/L(i);
    end
    Tau=(1-Rho).*Tau+Delta_Tau;
    
    %% ==============STEP6 Tabu set to ZERO==============
    Tabu=zeros(m,n);
end

%% ==============STEP7 Outputs==============
Pos=find(L_best==min(L_best));    
Shortest_Route=R_best(Pos(1),:)   
Shortest_Length=L_best(Pos(1))    

%% ==============Iteration Figures==============
figure(1)   %Iterations
x=linspace(0,iter_max,iter_max);
y=L_best(:,1);
plot(x,y,':','LineWidth',2);
xlabel('Iterations'); ylabel('Thelength of shortest path');
bestPath=Shortest_Route;
figure(2)   %Plot the shortest path
plot3([C(Shortest_Route,1)],[C(Shortest_Route,2)],[C(Shortest_Route,3)],'o:', 'MarkerSize', 5, 'MarkerFaceColor', 'g','linewidth',2);
axis equal
for i = 1:size(C,1)
    text(C(i,1),C(i,2),C(i,3),['   ' num2str(i)]);
end
N=length(curve);
for ii=1:N
    newCurve{ii}=curve{ii}(:,Shortest_Route);
end