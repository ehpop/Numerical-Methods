x = linspace(-1, 1, 100);
f = @(x) (1./(1+25*x.^2));
y = f(x);

figure;

% k = n+2
subplot(1,3,1);
plot(x, y, 'LineWidth', 2);
hold on;
for n = [3, 5, 7, 11]
    k = n+2;
    xn = linspace(-1, 1, k);
    pn = polyfit(xn, f(xn), n);
    plot(x, polyval(pn, x), 'DisplayName', ['n=' num2str(n)], 'LineWidth', 1.5);
end
title('k = n+2');
legend;

% k = 2n
subplot(1,3,2);
plot(x, y, 'LineWidth', 2);
hold on;
for n = [3, 5, 7, 11]
    k = 2*n;
    xn = linspace(-1, 1, k);
    pn = polyfit(xn, f(xn), n);
    plot(x, polyval(pn, x), 'DisplayName', ['n=' num2str(n)], 'LineWidth', 1.5);
end
title('k = 2n');
legend;

% k = 3n
subplot(1,3,3);
plot(x, y, 'LineWidth', 2);
hold on;
for n = [3, 5, 7, 11]
    k = 3*n;
    xn = linspace(-1, 1, k);
    pn = polyfit(xn, f(xn), n);
    plot(x, polyval(pn, x), 'DisplayName', ['n=' num2str(n)], 'LineWidth', 1.5);
end
title('k = 3n');
legend;
