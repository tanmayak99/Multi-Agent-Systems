% This function multiplies matrix a and b and returns the result f.
% matrix a dimensions -> N*N
% matrix b dimensions -> N*1
function f = multiplyMatrix(a,b,N)

for i = 1:N
    sum = 0;
    for j = 1:N
        sum = sum + a(i,j)*b(j);
    end
    f(i) = sum;
end

end
