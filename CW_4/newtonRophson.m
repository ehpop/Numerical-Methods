function [root, value, iterations] = newtonRophson(x, f, err, dx, max_iterations, diriv_option)
    if nargin < 6
        diriv_option = 1;
    end
    if nargin < 5
        max_iterations = 100;  % Default value for max_iterations
    end
    if nargin < 4
        dx = 1e-1;  % Default value for dx
    end
    if nargin < 3
        err = 1e-7;  % Default value for err
    end
    if nargin < 2
        error('Insufficient number of input arguments.');
    end

    i = 1;
    while i < max_iterations && abs(f(x)) > err
        x = x - (f(x) / diriv(f, x, dx, diriv_option));
        i = i + 1;
    end

    root = x;
    value = f(root);
    iterations = i;
end

