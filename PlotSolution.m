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

function PlotSolution(tour, model)

    tour = [tour tour(1)];
    
    plot(model.x(tour), model.y(tour), 'k-o', ...
        'MarkerSize', 10, ...
        'MarkerFaceColor', 'y', ...
        'LineWidth', 1.5);
    
    xlabel('x');
    ylabel('y');
    
    axis equal;
    grid on;
    
	alpha = 0.1;
	
    xmin = min(model.x);
    xmax = max(model.x);
    dx = xmax - xmin;
    xmin = floor((xmin - alpha*dx)/10)*10;
    xmax = ceil((xmax + alpha*dx)/10)*10;
    xlim([xmin xmax]);
    
    ymin = min(model.y);
    ymax = max(model.y);
    dy = ymax - ymin;
    ymin = floor((ymin - alpha*dy)/10)*10;
    ymax = ceil((ymax + alpha*dy)/10)*10;
    ylim([ymin ymax]);
    
    
end