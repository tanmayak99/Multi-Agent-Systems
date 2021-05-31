% This function find if the states of the agents stored in posX and posY
% have achieved consensus.

function f = isConsensus(posX , posY , N , R)
    belong2group = zeros(N);
    belong2group(1) = 1;
    
    cnt = 0;
    for i = 1:N
        if belong2group(i) == 1
            cnt = cnt+1;
            for j = 1:N
                if belong2group(j) ==0 && abs(posX(i) - posX(j)) <= R && abs(posY(i) - posY(j)) <= R
                    belong2group(j) = 1;
                end
            end
        end
    end
    
    if cnt == N
        f = 1;
    else 
        f = 0;
    end

end
