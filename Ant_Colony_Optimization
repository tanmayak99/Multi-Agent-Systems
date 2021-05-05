%Ant Colony Optimization for single food source
clear all;
%Defining and initializing Parameters
global Lx Ly stepsize nmax n;  %global so that can be used in other functions also
Lx=500; Ly=500; stepsize=5; nmax=50; %nmax is the size of ant colony, Lx and Ly are the dimension of area, stepsize is length of one step
total_time=2000; % Number of time steps
Grnd_pot0=sparse(zeros(Lx,Ly)); Grnd_pot1=sparse(zeros(Lx,Ly)); %Natural ground potential
n=10; % foreaging ants
nest=[100 100]; % position of nest
ri = zeros(n,2); ri(:,1)=nest(1); ri(:,2)=nest(1,2); ri(:,4)=0; ri(:,5)=0; ri(:,3)=0;
% ant parameters that is x-position, y-position, state, time of leaving nest, time of leaving food source
source = [250 250]; % position of food sources
ns = length(source); % count of food sources
s=10; % food source has a size(not point source)
epsilon_0 = 1; % Initial fluctuation intensity
epsilon = zeros(n,1)+epsilon_0; % matrix of Fluctuation intensity 
epsilon_rate = 0.02; % Fluctuation intensity change rate
epsilon_max = 5; % Maximum value of fluctuation intensity
aviobj = VideoWriter('trail.avi'); % Used to create video file out of grid 
dr = 15; % unit change in r
checkboundary = 0; % if current step is outside the boundry then we have to calculate different step else current step is ok
drand=[0,0]; % drand initialization
grad = [0,0]; % grad initialization
direction = randn(n,2)*2-1; %direction initialization
% Generating world that is 2-d here 
world = ones(Lx,Ly);
world(100:Lx-100,100:Ly-100)=0;
world = sparse(world);

%Start iterating over time 
for t=1:total_time %iteration over time 1 to 2000
    %Calculation of pheromone matrix
    for ii=-s:s
        for jj=-s:s
        Grnd_pot1(source(1)+ii,source(2)+jj)=max(max(Grnd_pot1));
        Grnd_pot0(nest(1)+ii,nest(2)+jj)=max(max(Grnd_pot0)); 
        end
        %maximum ground potential is assigned near food source and nest
    end
    [Grnd_pot0,Grnd_pot1]=G(ri,t,Grnd_pot0,Grnd_pot1,direction,n);
    
    % Now calculating new position for each ant i
    for i=1:n
        checkboundary = 0;
        if ri(i,3)==1 %that is ith ant is travelling towards nest or food
            Trl_potXpos=Trl_pot([ri(i,1)+dr,ri(i,2)],Grnd_pot0,direction(i,:));
            Trl_potXneg=Trl_pot([ri(i,1)-dr,ri(i,2)],Grnd_pot0,direction(i,:));
            Trl_potYpos=Trl_pot([ri(i,1),ri(i,2)+dr],Grnd_pot0,direction(i,:));
            Trl_potYneg=Trl_pot([ri(i,1),ri(i,2)-dr],Grnd_pot0,direction(i,:));
        elseif ri(i,3)==0
            Trl_potXpos=Trl_pot([ri(i,1)+dr,ri(i,2)],Grnd_pot1,direction(i,:));
            Trl_potXneg=Trl_pot([ri(i,1)-dr,ri(i,2)],Grnd_pot1,direction(i,:));
            Trl_potYpos=Trl_pot([ri(i,1),ri(i,2)+dr],Grnd_pot1,direction(i,:));
            Trl_potYneg=Trl_pot([ri(i,1),ri(i,2)-dr],Grnd_pot1,direction(i,:));
        end
        grad = [(Trl_potXpos-Trl_potXneg)/2,(Trl_potYpos-Trl_potYneg)/2]; %gradient of ground potential 
        %creating a step that is inside our boundary
        while checkboundary == 0
            if t==1 %starting time 
                fluctuation = rand(1,2)*2-1;
                direction(i,:)=fluctuation/norm(fluctuation);
            else
                fluctuation = rand(1,2)*2-1;
                direction(i,:) = (direction(i,:)+grad)/norm(direction(i,:)+grad);
                direction(i,:) = stepsize*direction(i,:)+epsilon(i,1)*fluctuation;
                direction(i,:)= direction(i,:)/norm(direction(i,:));
            end
            checkboundary = checkboundaries(ri(i,1:2),direction(i,:),world); %updating checkboundary
        end
        ri(i,1:2)= round(ri(i,1:2)+stepsize*direction(i,1:2)); %updating x and y cordinates of ant
        
        if ri(i,3)==0  % that is for ant looking for food source
            if epsilon(i,1)<epsilon_max
                epsilon(i,1)=(epsilon_0+epsilon_rate*(t-ri(i,4)))^2;
            end
               if ri(i,1)<source(1)+s && ri(i,1)>source(1)-s && ri(i,2)>source(2)-s && ri(i,2)<source(2)+s
                    ri(i,3)=1; ri(i,5)=t; continue; % that is food source is reached update direction of ith ant and note the time
              
            end
        elseif ri(i,3)==1 % that is for ant returning to the nest
            epsilon(i,1)=(epsilon_0)^2;
            if ri(i,1)<nest(1)+s && ri(i,1)>nest(1)-s && ri(i,2)>nest(2)-s && ri(i,2)<nest(2)+s
                % Recruitment of new ants near nest
                if n<nmax
                    n=n+1;
                    ri(n,1:5)=[nest(1),nest(2),0,t,0];
                    direction(n,1:2)=-direction(i,1:2);
                    epsilon(n,1)=epsilon_0^2;
                end
                ri(i,3)=0; ri(i,4)=t; continue; % that is nest is reached update direction of ith ant and note the time
            end
        end
        %Plotting the positions of ants and pheromones
        
        %red colour is assigned for ants returning towards nest and others with green
        if ri(i,3)==1
            color = 'r.';
        elseif ri(i,3)==0
            color = 'g.';
        end
        set(gca, 'FontSize', 16);
        xlabel('x-Position', 'FontSize', 16);
        ylabel('y-Position', 'FontSize', 16);
        plot(ri(i,1),ri(i,2),color); axis([0 Lx 0 Ly]); hold on;
        %position of each ant is plotted
    end
    %now plotting the logarithmic of pheromone levels
    box on;
    caxis ([0 8]);
    cb = colorbar('vert','FontSize',16);
    zlab = get(cb,'ylabel');
    set(zlab,'String','log(Pheromone Amount) [a.u.]','FontSize',16);
    text(50,450,['Time t = ', num2str(t)], 'FontSize',16);
    %marking source as O on the plot
    plot(source(1),source(2),'o');
    
    %marking nest as X on the plot
    plot(nest(1),nest(2),'x');
    %plotting ground potential
    contour(log(Grnd_pot0'));
    contour(log(Grnd_pot1'));
    if mod(t,100)==0
        hgsave([num2str(t),'.fig']);
    end
    Frame(t) = getframe;
    hold off;
    pause(0.01);
end
aviobj = addframe(aviobj,Frame);
aviobj = close(aviobj);
