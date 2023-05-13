a = -1;
b = 1;

funcs = {@f1, @f2, @f3};
exact_values = [0.735759, 1.570796, 2.666667];
n_values = 1:100;

methods = {'METODA TRAPEZÓW', 'METODA SIMPSONA (1/3)', 'METODA SIMPSONA (3/8)', 'METODA BOOLA'};
options = [1, 2, 3, 4];

errors_f1 = zeros(numel(methods), numel(n_values));
errors_f2 = zeros(numel(methods), numel(n_values));
errors_f3 = zeros(numel(methods), numel(n_values));

for i = 1:numel(methods)
    for j = 1:numel(funcs)
        for k = 1:numel(n_values)
            result = complexNewtonCotes(funcs{j}, n_values(k), a, b, options(i));
            error = abs((exact_values(j) - result)/exact_values(j)) * 100;
            if j == 1
                errors_f1(i, k) = error;
            elseif j == 2
                errors_f2(i, k) = error;
            elseif j == 3
                errors_f3(i, k) = error;
            end
        end
    end
end

figure;

subplot(3, 1, 1);
semilogy(n_values, errors_f1, 'o-');
legend(methods);
xlabel('n');
ylabel('Błąd względny');
title('Wykres dla f1');

subplot(3, 1, 2);
semilogy(n_values, errors_f2, 'o-');
legend(methods);
xlabel('n');
ylabel('Błąd względny');
title('Wykres dla f2');

subplot(3, 1, 3);
semilogy(n_values, errors_f3, 'o-');
legend(methods);
xlabel('n');
ylabel('Błąd względny');
title('Wykres dla f3');
