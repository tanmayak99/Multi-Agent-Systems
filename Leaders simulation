% This code simulates consensus algorithm for N agents psudorandomly uniformly
% spawned in a disc of radius 0.5 units
% The information flow between the agents depends on their relative
% distances. So the adjacency matrix of the toplogy keeps changing.
% Any two agents within a distance 'r' can transfer and receive the info
% and hence constructs and edge.
% There are integer(N/nl) number of leaders assigned in the algorithm
% which means every single agent in 'nl' number of agents is a leader.
clc;
clear all;

posLx = 0.2;        %DESIRED LOCATION x coordinate
posLy = 0.2;        %DESIRED LOCATION y coordinate
eps = 0.001;        %used for precise double calculation

N = 100;            %Number of agents
r = 0.4;            %parameter for edge construction
ifPlot = 1;         %if plot required, this parameter is 1, else 0
nL = 30;            %every single agent in nl agents is a leader

%parameters for leaders simulation
wf = 0.1;
wy = 0.9;

R = 0.5; % disc radius for generation of nodes
dt = 0.001; %time jump for discrete calculation 

% uniform random generation of agents with a disc of radius 0.5 units
for i=1:N
    rad = R*rand(1);
    theta = 2*pi*rand(1);
    posX(i) = rad*cos(theta);
    posY(i) = rad*sin(theta);
end

posX
posY

cnt = 1;
cnt2 = 1;
consensus = 0;

for i=1:N
    posXg(cnt,i) = posX(i);
    posYg(cnt,i) = posY(i);
end

for d = 0:dt:2
    
    cnt2 = cnt2 + 1;
    if mod(cnt2,3) == 0
        cnt = cnt+1;
        for i=1:N
            posXg(cnt,i) = posX(i);
            posYg(cnt,i) = posY(i);
        end
    end
    
    for i=1:N
        posXdot = 0;
        posYdot = 0;
        posLeaderXdot = 0;
        posLeaderYdot = 0;
        
        for j=1:N
            
            if mod(i,nL) == 1
                if i~=j 
                    dis = abs(distance(posX(i),posY(i),posX(j),posY(j))) ;
                    if r - dis >= eps 
                        posXdot = posXdot + posX(j) - posX(i);
                        posYdot = posYdot + posY(j) - posY(i);
                    end
                end
                
                
            else
                if i~=j
                    
                    if mod(j,nL) == 1
                        posLeaderXdot = posLeaderXdot + posX(j) - posX(i);
                        posLeaderYdot = posLeaderYdot + posY(j) - posY(i);
                        
                    else
                        dis = abs(distance(posX(i),posY(i),posX(j),posY(j))) ;
                        if r - dis >= eps 
                            posXdot = posXdot + posX(j) - posX(i);
                            posYdot = posYdot + posY(j) - posY(i);
                        end
                    end
            
                end
        end
        
        if mod(i,nL) ~=1
            posXdot = wf*posXdot + wy*posLeaderXdot;
            posYdot = wf*posYdot + wy*posLeaderYdot;
            posX(i) = posX(i) + dt*posXdot;
            posY(i) = posY(i) + dt*posYdot;
        
        else
            posX(i) = posX(i) + dt*(wf*posXdot + wy*(posLx-posX(i)));
            posY(i) = posY(i) + dt*(wf*posYdot + wy*(posLy-posY(i)));
        end
        end
    
        if consensus == 0
            consensus = isConsensus(posX,posY,N,r);
        end

    end
end
f = consensus
posX
posY

if ifPlot == 1
l = plotSimulationsForLeaders(posXg,posYg,cnt,N);
end
