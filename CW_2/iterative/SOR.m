function [x, iter] = SOR(A, b, x0, max_iter, tol, omega)

n = length(b);
x = x0;
iter = 0;
err = Inf;

while err > tol && iter < max_iter
    x_prev = x;
    for i = 1:n
        sigma = 0;
        for j = 1:n
            if j ~= i
                sigma = sigma + A(i,j) * x(j);
            end
        end
        x(i) = (1 - omega) * x(i) + omega * (b(i) - sigma) / A(i,i);
    end
    iter = iter + 1;
    err = norm(x - x_prev, Inf);
end

end
