% funkcja f(x)
f = @(x) (1./(1+25*x.^2));

% liczba punktów interpolacji
n = 20;

% węzły Czebyszewa
x_cheb = cos(pi*(0:n)/(n));

% wartości funkcji w węzłach Czebyszewa
y_cheb = f(x_cheb);

% punkty do wykresu
x_plot = linspace(-1,1,100);
y_plot = f(x_plot);

% wykres    
figure();

i = 1;
% interpolacja dla różnych stopni wielomianów interpolacyjnych
for k = [2*n, 3*n, 4*n]
    x = cos(pi*(0:k)/k);
    y = f(x);
    
    % interpolacja
    p = interpolacja_newtona(x, y, x_plot);
    
    subplot(1, 3, i);
    plot(x_plot, y_plot, 'k-', x_plot, p, 'r-', x_cheb, y_cheb, 'bo', 'LineWidth', 1.5);
    legend('f(x)', ['n=' num2str(k)], 'Czebyszew', 'Location', 'South');
    title('Interpolacja funkcji Rungego');
    xlabel('x');
    ylabel('y');
    i = i + 1;
end
