% funkcja
f = @(x) 1./(1+25*x.^2);

% Wybierz stopnie wielomianów
n_vec = [2 4 6 8];

% Generuj równo odległe punkty
x = linspace(-1, 1, 100);

% Oblicz wartości funkcji w punktach x
f_values = f(x);

% Inicjuj pusty wektor wynikowy
p_values = zeros(length(n_vec), length(x));

% Dla każdego stopnia wielomianu wykonaj interpolację i zapisz wyniki
for i=1:length(n_vec)
    n = n_vec(i);
    xn = linspace(-1, 1, n+1);
    fn = f(xn);
    p_values(i,:) = interpolacja_newtona(xn, fn, x);
end

% Narysuj wykresy
figure();
plot(x, f_values, 'k-', 'LineWidth', 2);
hold on;

colors = {'r-', 'g-', 'b-', 'm-'};

for i=1:length(n_vec)
    plot(x, p_values(i,:), colors{i}, 'LineWidth', 1);
end

xlabel('x');
ylabel('f(x)');
title('Interpolacja wielomianowa (metoda Newtona)');
legend('f(x)', 'n=2', 'n=4', 'n=6', 'n=8');