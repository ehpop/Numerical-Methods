f = @(x) sin(x);

k1 = 3+2; % k dla n = 3
k2 = 5*2; % k dla n = 5
k3 = 7*3; % k dla n = 7

x = linspace(-1, 1, 100);

n1 = 3;
n2 = 5;
n3 = 7;
n4 = 11;

p1 = polyfit(x, f(x), n1);
p2 = polyfit(x, f(x), n2);
p3 = polyfit(x, f(x), n3);
p4 = polyfit(x, f(x), n4);

figure;

subplot(1,3,1);
hold on;
plot(x, f(x), 'k', 'LineWidth', 2);
plot(x, polyval(p1, x), 'r--');
plot(x, polyval(p2, x), 'g--');
plot(x, polyval(p3, x), 'b--');
plot(x, polyval(p4, x), 'm--');
title('n = 3');
legend('f(x)', 'F3(x)', 'F5(x)', 'F7(x)', 'F11(x)');
hold off;

subplot(1,3,2);
hold on;
plot(x, f(x), 'k', 'LineWidth', 2);
plot(x, polyval(p1, x), 'r--');
plot(x, polyval(p2, x), 'g--');
plot(x, polyval(p3, x), 'b--');
plot(x, polyval(p4, x), 'm--');
title('n = 5');
legend('f(x)', 'F3(x)', 'F5(x)', 'F7(x)', 'F11(x)');
hold off;

subplot(1,3,3);
hold on;
plot(x, f(x), 'k', 'LineWidth', 2);
plot(x, polyval(p1, x), 'r--');
plot(x, polyval(p2, x), 'g--');
plot(x, polyval(p3, x), 'b--');
plot(x, polyval(p4, x), 'm--');
title('n = 7 or 11');
legend('f(x)', 'F3(x)', 'F5(x)', 'F7(x)', 'F11(x)');
hold off;
