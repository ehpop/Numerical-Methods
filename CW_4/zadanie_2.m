x = linspace(-10, 10, 2000);
y = f1(x);

[root, value, iters] = newtonRophson(-10, @f1, 1e-7, 1e-1, 1e10);

fprintf("Bisection root found for x = %.5e\n" + ...
    "Bisection root value = %.5e\n" + ...
    "Bisection Number of Iterations = %d\n", root, value, iters);

figure;
plot(x, y, 'b-', 'LineWidth', 1.5);  % Plot x and y in blue
hold on;
scatter(root, value, 50, 'red');  % Plot bisection_args and bisection_values as red filled circles

xlabel('x');
ylabel('y');
title('Plot of f1(x) and Bisection Points');
legend('f1(x)', 'root');
grid on;
box on;