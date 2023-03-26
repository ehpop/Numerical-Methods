% funkcja f(x)
f = @(x) (1./(1+25*x.^2));

% punkty do wykresu
x = linspace(-1,1,100);
y = f(x);

% stopnie wielomianów
n_values = [2 4 10 20 30 40];

% przygotowanie tabeli wyników
table_results = cell(length(n_values)*2+1, 3);
table_results{1,1} = 'Stopień n';
table_results{1,2} = 'k';
table_results{1,3} = 'ΔFn(x)';

table_results_2 = cell(length(n_values)*2+1, 3);
table_results_2{1,1} = 'Stopień n';
table_results_2{1,2} = 'k';
table_results_2{1,3} = 'ΔFn(x)';

i = 2;
for k = n_values
    % interpolacja
    x_cheb = cos(pi*(0:k)/k);
    y_cheb = f(x_cheb);
    p_cheb = interpolacja_newtona(x_cheb, y_cheb, x);
    
    p_uniform = polyfit(x,y,k);
    
    % maksymalny błąd bezwzględny - wzór 1
    max_error_cheb_abs = max(abs(p_cheb - y));
    max_error_uniform_abs = max(abs(polyval(p_uniform,x) - y));

    % maksymalny błąd względny - wzór 2
    max_error_cheb_rel = max(abs(p_cheb - y)./ y);
    max_error_uniform_rel = max(abs((polyval(p_uniform, x) - y)./ y));
    
    % dodanie wyników do tabeli
    table_results{i,1} = k;
    table_results{i,2} = "Czebyszew";
    table_results{i,3} = max_error_cheb_abs;
    
    table_results{i+1,1} = k;
    table_results{i+1,2} = "Równoodległe";
    table_results{i+1,3} = max_error_uniform_abs;

    table_results_2{i,1} = k;
    table_results_2{i,2} = "Czebyszew";
    table_results_2{i,3} = max_error_cheb_rel;
    
    table_results_2{i+1,1} = k;
    table_results_2{i+1,2} = "Równoodległe";
    table_results_2{i+1,3} = max_error_uniform_rel;
    
    i = i + 2;
end

% wyświetlanie tabeli
disp("Tabela wyników:")
disp(table_results)

% wyświetlanie tabeli
disp("Tabela wyników błędu bezwzględnego:")
disp("|Stopień n   |  k  |    ΔFn(x) |")

for i= 2:size(table_results, 1)
    row = table_results(i, :);
    if abs(f(x(1))) < 1e-4 || abs(f(x(end))) < 1e-4
        continue % pomiń przedziały z osobliwościami
    end
    line = sprintf("|  %2d  |   %13s  |   %0.4f   |", row{1}, row{2}, row{3});
    disp(line);
end

% wyświetlanie tabeli
disp("Tabela wyników błędu względnego:")
disp("|Stopień n   |  k  |    ΔFn(x) |")

for i= 2:size(table_results_2, 1)
    row = table_results_2(i, :);
    if abs(f(x(1))) < 1e-4 || abs(f(x(end))) < 1e-4
        continue % pomiń przedziały z osobliwościami
    end
    line = sprintf("|  %2d  |   %13s  |   %0.4f   |", row{1}, row{2}, row{3});
    disp(line);
end

