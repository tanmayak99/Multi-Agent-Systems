% This function plots the trajectories of N agnets whose information are
% stored in posXg and posYg.

function f = plotSimulationsForLeaders(posXg,posYg,cnt,N)
    figure
    title('Motion animation');
    xlabel('x (m)');
    ylabel('y (m)');
    
    % variables storing the axes limits for the plots
%     mnX = min(posXg(:));
%     mxX = max(posXg(:));
%     mnY = min(posYg(:));
%     mxY = max(posYg(:));
    
    mnX = -0.5;
    mxX = 0.5;
    mnY = -0.5;
    mxY = 0.5;
    
    for j = 1:cnt
        fn(1) = plot(posXg(j,1),posYg(j,1),'ko', 'MarkerSize', 3);
        hold on;
        
        plot(0.2,0.2,'r*')    % for marking leaders position
        
        for i=2:N
            fn(i) = plot(posXg(j,i),posYg(j,i),'ko', 'MarkerSize', 3);
        end
        hold off;

        axis([mnX mxX mnY mxY]);

        for i=1:N
            set(fn(i),'XData',posXg(j,i),'YData',posYg(j,i));
            pause(0.005);
        end
    end
    f=1;
end
