function [y] = diriv(f, x, d, option)
    % diriv - Numerical derivative calculation using finite difference approximation.
%
% Usage:
%   y = diriv(f, x, d, option)
%
% Inputs:
%   f      - The function for which the derivative is to be calculated. It should be a function handle or function name.
%   x      - The point at which the derivative is to be evaluated.
%   d      - The step size for the finite difference approximation.
%   option - (Optional) An argument to specify the differencing option. It can take values 1, 2, or 3. Default is 1.
%
% Outputs:
%   y      - The numerical derivative of f at x based on the chosen differencing option.
%
% Description:
%   The diriv function calculates the numerical derivative of a given function f at a specific point x using a finite difference approximation.
%   It provides flexibility in choosing different differencing options based on the option argument.
%   The differencing options are as follows:
%     - Option 1: Central difference approximation. (Default)
%     - Option 2: Forward difference approximation.
%     - Option 3: Backward difference approximation.
%
% Example:
%   % Define the function
%   f = @(x) x^2;
%
%   % Calculate the derivative using diriv
%   x = 2;
%   d = 0.1;
%   option = 1;
%   derivative = diriv(f, x, d, option);
%
%   disp(derivative); % Output: 4.04

    if nargin < 3
        error('Incorect ammount of args')
    elseif nargin < 4
        option = 1;
    end
    
    switch option
        case 1
            y = (f(x+d)-f(x-d))/(2*d);
        case 2
            y = (f(x+d)-f(x)) / d;
        case 3
            y = (f(x) - f(x-d)) / d;
    end
end

