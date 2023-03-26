function [x, iter] = jacobi(A, b, x0, max_iter, eps)

n = size(A, 1);
x = x0;
iter = 0;

for k = 1:max_iter
    for i = 1:n
        x(i) = (b(i) - A(i,[1:i-1 i+1:end]) * x0([1:i-1 i+1:end])) / A(i,i);
    end
    
    if norm(x - x0, 2) / norm(x, 2) < eps
        break;
    end
    
    x0 = x;
    iter = iter +1;
end

end
