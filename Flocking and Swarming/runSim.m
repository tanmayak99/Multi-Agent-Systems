% This code simulates consensus algorithm for N agents psudorandomly uniformly
% spawned in a disc of radius 0.5 units
% The information flow between the agents depends on their relative
% distances. So the adjacency matrix of the toplogy keeps changing.
% Any two agents within a distance 'r' can transfer and receive the info
% and hence constructs and edge.

function f = runSim(N,r,ifPlot)
R = 0.5; % disc radius for generation of nodes
dt = 0.001; %time jump for discrete calculation 

% uniform random generation of agents with a disc of radius 0.5 units
for i=1:N
    rad = R*rand(1);
    theta = 2*pi*rand(1);
    posX(i) = rad*cos(theta);
    posY(i) = rad*sin(theta);
end

cnt = 0;
cnt2 = 0;
consensus = 0;
for d = 0:dt:1
    
    cnt2 = cnt2 + 1;
    if mod(cnt2,50) == 0
        cnt = cnt+1;
        for i=1:N
            posXg(cnt,i) = posX(i);
            posYg(cnt,i) = posY(i);
        end
    end
    
    for i=1:N
        posXdot = 0;
        posYdot = 0;
        for j=1:N
            if i~=j
                dis = abs(distance(posX(i),posY(i),posX(j),posY(j))) ;
                if r - dis >= 0.001 
                    posXdot = posXdot + posX(j) - posX(i);
                    posYdot = posYdot + posY(j) - posY(i);
                end
            end
        end
        posX(i) = posX(i) + dt*posXdot;
        posY(i) = posY(i) + dt*posYdot;
    end
    
    if consensus == 0
        consensus = isConsensus(posX,posY,N,r);
    end
    
end
f = consensus

if ifPlot == 1
l = plotSimulations(posXg,posYg,cnt,N);
end
end
