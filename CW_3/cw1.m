a = -1;
b = 1;

funcs = {@f1, @f2, @f3};
exact_values = [0.735759, 1.570796, 2.666667];
methods = {'METODA TRAPEZÓW', 'METODA PROSTOKĄTÓW', 'METODA SIMPSONA (1/3)', 'METODA SIMPSONA (3/8)'};
options = [1, 2, 3, 4];

for i = 1:numel(methods)
    fprintf("%s:\n", methods{i});
    for j = 1:numel(funcs)
        result = basicNewtonCotes(funcs{j}, a, b, options(i));
        error = abs((exact_values(j) - result) / exact_values(j)) * 100;
        fprintf("arr_%d: %.6f (absolute error: %.2f%%\n", j, result, error);
    end
end
