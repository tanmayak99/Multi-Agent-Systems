%
% Copyright (c) 2015, Mostapha Kalami Heris & Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "LICENSE" file for license terms.
%
% Project Code: YPEA103
% Project Title: Ant Colony Optimization for Traveling Salesman Problem
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Cite as:
% Mostapha Kalami Heris, Ant Colony Optimization in MATLAB (URL: https://yarpiz.com/53/ypea103-ant-colony-optimization), Yarpiz, 2015.
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function model = CreateModel()

    x = [82 91 12 92 63 9 28 55 96 97 15 98 96 49 80 14 42 92 80 96];
    
    y = [66 3 85 94 68 76 75 39 66 17 71 3 27 4 9 83 70 32 95 3];
    
    %x = [82 91 12 92 63 9 28 55 96 97];
    
    %y = [66 3 85 94 68 76 75 39 66 17];
    
    n = numel(x);
    
    D = zeros(n, n);
    
    plot(x, y, 'k-o', ...
        'MarkerSize', 10, ...
        'MarkerFaceColor', 'y', ...
        'LineWidth', 1.5);
    
    pause(10);
    
    for i = 1:n-1
        for j = i+1:n
            
            D(i, j) = sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
            
            D(j, i) = D(i, j);
            
        end
    end
    
    model.n = n;
    model.x = x;
    model.y = y;
    model.D = D;

end
