function area = complexNewtonCotes(f, n, a, b, option)
% f -> function that will be integrated
% n -> num of division segments
% a -> lower limit of integration
% b -> upper limit of intergation
% d -> { 1 | 2 | 3 | 4 }
% 
% Output:
%   - area: Approximate area under the curve.
%
% https://pl.wikipedia.org/wiki/Metody_Newtona-Cotesa
% Integration Methods:
%   - Option 1: Composite trapezoidal rule.
%   - Option 2: Composite Simpson's 1/3 rule.
%   - Option 3: Composite Simpson's 3/8 rule.
%   - Option 4: Composite Boole's rule
%
% Example usage:
%   f = @(x) x.^2; % Define the function to be integrated
%   n = 100;       % Number of division segments
%   a = 0;         % Lower limit of integration
%   b = 2;         % Upper limit of integration
%   option = 1;    % Use the composite trapezoidal rule.
%   area = complexNewtonCotes(f, n, a, b, option); % Call the function to calculate the area


area = 0;
if (a > b)
    area = -1;
    return
end

h = (b - a) / n;
if option == 1
    for i = a:h:(b-h)
        area = area + (f(i) + f(i+h));
    end
    area = area * h/2;
elseif option == 2 
    for i = a:h:(b-h)
        area = area + (f(i) + 4 *f(i+h/2) + f(i+h));
    end
    h = h / 2;
    area = area * h/3;
elseif option == 3
    for i = a:h:(b-h)
        area = area + (f(i) + 3*f(i+h*(1/3)) + 3*f(i+h*(2/3)) + f(i+h));
    end
    h = h/3;
    area = area * h * 0.375;
elseif option == 4
    for i = a:h:(b-h)
        area = area + (7*f(i) + 32*f(i+h*(1/4)) + 12*f(i+h*(2/4)) + 32*f(i+h*(3/4)) + 7*f(i+h));
    end
    h = h/4;
    area = area * h * (2/45);
end

end