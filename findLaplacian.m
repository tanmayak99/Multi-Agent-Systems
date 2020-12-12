% This function find the Laplacian matrix of the graph with adjacency
% matrix a of dimensions N*N.

function l = findLaplacian(a,N)
for i = 1:N
    sum = 0;
    for j = 1:N
        if i~=j
            l(i,j) = -1*a(i,j);
            sum = sum + a(i,j);
        end
    end
    l(i,i) = sum;
end
end
