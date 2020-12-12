% A simple simulation to see convergence using consensus algorithm
% strongly connected graph
% 4 nodes
% Node 1 : (1,1)
% Node 2 : (2,6)
% Node 3 : (3,10)
% Node 4 : (10,4)

clc;
clear all;

%initial positions of 4 nodes
posX = [1;2;3;10]; 
posY = [1;6;10;4];

a = [0 0 0 1;
     1 0 0 0;
     0 1 0 0;
     0 1 1 0];
 
 N = 4;
 dt = 0.001;
 
 lap = findLaplacian(a,N);

cnt = 0;
cnt2 = 0;
for d = 0:dt:5
    cnt2 = cnt2 + 1;
    if mod(cnt2,10) == 0
        cnt = cnt+1;
        for i=1:N
            posXg(cnt,i) = posX(i); % storing the values for plotting the simulations
            posYg(cnt,i) = posY(i); % storing the values for plotting the simulations
        end
    end
    
    posXdot = -multiplyMatrix(lap,posX,N);
    posYdot = -multiplyMatrix(lap,posY,N);
    
    for i = 1:N
        posX(i) = posX(i) + dt*posXdot(i);
        posY(i) = posY(i) + dt*posYdot(i);
    end
end

% nodes converging at 3.1667,4.6667

l = plotSimulations(posXg,posYg,cnt,N);
