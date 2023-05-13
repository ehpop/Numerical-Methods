function area = basicNewtonCotes(f, a, b, option)
% f -> function that will be integrated
% a -> lower limit of integration
% b -> upper limit of intergation
% option -> { 1 | 2 | 3 | 4 }
% 
% Output:
%   - area: Approximate area under the curve.
%
% Integration Methods:
%   - Option 1: Midpoint rule (also known as rectangle rule).
%   - Option 2: Trapezoidal rule.
%   - Option 3: Simpson's 1/3 rule.
%   - Option 4: Simpson's 3/8 rule.
%
% Example usage:
%   f = @(x) x.^2; % Define the function to be integrated
%   a = 0;        % Lower limit of integration
%   b = 2;        % Upper limit of integration
%   option = 2;   % Use the trapezoidal rule
%   area = basicNewtonCotes(f, a, b, option); % Call the function to calculate the area

area = 0;
if (a > b)
    area = -1;
    return
end

if option == 1
    area = (b-a)*f((a+b)/2);
elseif option == 2
    area = 0.5*(b-a)*(f(a) + f(b));
elseif option == 3 
    area = (1/6)*(b-a)*(f(a)+4*f((b-a)/2)+f(b));
elseif option == 4
    h = (b-a)/3;
    area = f(a) + 3*f(a+h*(1/3)) + 3*f(a+h*(2/3)) + f(b);
end


end