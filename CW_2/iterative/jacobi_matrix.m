function [J] = jacobi_matrix(A)
    n = size(A,1); % liczba równań
    J = eye(n); % inicjalizacja macierzy Jacobiego jako macierzy jednostkowej
    for i = 1:n
        for j = 1:n
            if i ~= j
                J(i,j) = -A(i,j) / A(i,i);
            end
        end
    end

end