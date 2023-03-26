function [x, iter] = gauss_seidel(A, b, x0, max_iter, tol)

n = length(b);
x = x0;
iter = 0;

while iter < max_iter
    for i = 1:n
        x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i, i+1:n)*x0(i+1:n))/A(i,i);
    end
    
    if norm(A*x - b) < tol
        break;
    end

    iter = iter + 1;
    x0 = x;

end

end
