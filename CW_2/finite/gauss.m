function [x] = gauss(A, b)

n = size(A, 1);

for i = 1:n

    [~, col_index] = max(abs(A(i:n, i)));
    adj_col_index = col_index + i - 1;
    
    temp = A(i,:);
    A(i,:) = A(adj_col_index,:);
    A(adj_col_index,:) = temp;

    temp = b(i);
    b(i) = b(adj_col_index);
    b(adj_col_index) = temp;

    for j = 1:i-1
        l = -(A(i,j)/A(j,j));
        
        A(i,:) = A(i,:) + l * A(j,:);
        b(i) = b(i) + l * b(j);
    end
end

x = zeros(size(b));

for i = n:-1:1
    for j = n : -1 : i + 1
        b(i) = b(i) - A(i, j)*x(j);
    end
    x(i) = b(i) / A(i, i);
end


end