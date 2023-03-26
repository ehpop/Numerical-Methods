function [J] = gauss_seidel_matrix(A)
n = size(A,1);
J = zeros(n,n);

for i = 1:n
    J(i,i) = 1/A(i,i);
    for j = 1:n
        if i ~= j
            J(i,j) = -A(i,j)/(A(i,i) + A(j,j));
        end
    end

end