function [root, value, iterations, bisection_args, bisection_values] = bisection(a, b, f, max_iterations)
%BISECTION Summary of this function goes here
%   a = lower bound
%   b = upper bound
%   f = function
%   iterations = number of iterations

err = 1e-8;

i = 1;
mid = (a + b) / 2;
bisection_values = [[], f(mid)];
bisection_args = [[], mid];
while i < max_iterations && abs(f(mid)) > err 
    if f(a) * f(mid) < 0
        b = mid;
    else
        a = mid;
    end

    mid = (a + b) / 2;
    i = i + 1;
    bisection_values = [bisection_values, f(mid)];
    bisection_args = [bisection_args, mid];
end

root = mid;
value = f(mid);
iterations = i;

end