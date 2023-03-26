% funkcja f(x)
f = @(x) (1./(1+25*x.^2));

% punkty do wykresu
x = linspace(-1,1,100);
y = f(x);

% stopnie wielomianów
n_values = [5 10 20 50];

% liczba węzłów interpolacji i aproksymacji
m_values = [5 10 20 50];

% przygotowanie tabeli wyników
table_results = cell(length(n_values)*length(m_values)+1, 4);
table_results{1,1} = 'Liczba węzłów';
table_results{1,2} = 'Stopień n';
table_results{1,3} = 'Interpolacja';
table_results{1,4} = 'Aproksymacja';

i = 2;
for m = m_values
    for n = n_values
        % węzły interpolacji i aproksymacji
        x_int = linspace(-1, 1,m+1);
        y_int = f(x_int);

        x_apr = linspace(-1,1,n+1);
        y_apr = f(x_apr);

        % interpolacja
        p_int = interpolacja_newtona(x_int, y_int, x);

        % aproksymacja
        p_apr = polyfit(x_apr, y_apr, n);

        % maksymalny błąd bezwzględny
        max_error_int_abs = max(abs(p_int - y));
        max_error_apr_abs = max(abs(polyval(p_apr,x) - y));

        % dodanie wyników do tabeli
        table_results{i,1} = m;
        table_results{i,2} = n;
        table_results{i,3} = max_error_int_abs;
        table_results{i,4} = max_error_apr_abs;

        i = i + 1;
    end
end

% wyświetlenie tabeli
disp("Tabela wyników:")
disp("|Liczba węzłów| Stopień n | Interpolacja | Aproksymacja |")

for i= 2:size(table_results, 1)
    row = table_results(i, :);
    line = sprintf("|     %3d      |    %3d    |   %0.4f    |   %0.4f     |", row{1}, row{2}, row{3}, row{4});
    disp(line);
end

% wykres funkcji i interpolacji/aproksymacji
figure();
plot(x, y, 'r--', x, p_int, 'b--', x, polyval(p_apr, x), 'g--');
legend('f(x)', 'interpolacja', 'aproksymacja')

figure();
subplot(1,3,1);
plot(x,y,'b-');
title('f(x)');
xlabel('x');
ylabel('y');
grid on;

subplot(1,3,2);
plot(x, p_int, 'r--');
title('Interpolacja');
xlabel('x');
ylabel('y');
grid on;

subplot(1,3,3);
plot(x, polyval(p_apr,x),'g--');
title('Aproksymacja');
xlabel('x');
ylabel('y');
grid on;

