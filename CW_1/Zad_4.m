x = linspace(-1,1,100);
f = @(x) (1./(1+25*x.^2));
y = f(x);

n_values = [2, 4, 10, 20, 30, 40, 50, 80, 90];

figure();
% wykres f(x)
subplot(ceil((length(n_values)+1)/2),2,1)
plot(x, y, 'k-', 'LineWidth', 1.5);
legend('f(x)');
title('Funkcja Rungego');
xlabel('x');
ylabel('y');

for i = 1:length(n_values)
    n = n_values(i);
    x_n = [x(1), x(int32(n/2 + 1):int32(end-n/2)), x(end)];
    y_n = f(x_n);
    
    % interpolacja
    p = interpolacja_newtona(x_n, y_n, x);
    
    % wykres
    subplot(ceil((length(n_values)+1)/2),2,i+1)
    plot(x, p, 'b-', 'LineWidth', 1.5);
    legend(['n=' num2str(n)]);
    title('Interpolacja funkcji Rungego');
    xlabel('x');
    ylabel('y');
end
