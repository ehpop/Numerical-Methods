x = linspace(-1, 1, 100);
f = @(x) (1./(1+25*x.^2));

plot(x, f(x));

xn = [-1,-0.5, 0, 0.5, 1];
fn = f(xn);

% aproksymacja - nie przechodzi przez dokładne wartości
%wL = polyfit(xn, fn, 2);

%interpolacja
wL = polyfit(xn, fn, 4);
wL_my = lagr_int(xn, fn, 1);

% narysuj oryginalna funkcje i interpolowana funkcje
plot(x, f(x), x, polyval(wL, x));

%fl = [];

%for i = 1:100
%    fl = [fl polyval(wL, x(i))];
%end

fl = [];

for i = 1 : 100
    fl = [fl lagr_int(xn, fn, x(i))];
end

plot(x, f(x), x, polyval(wL, x), x, fl);

% aproksymacja ( tak jak tutaj za pomocą polyfit, jeśli ostatni argumen to mniej lub więcej --> aproksymacja )



% interpolacja Newtona
fx = f(x)

% Współczynniki różnic dzielonych Newtona
coeffs = newton_wsp(x, fx);

% Wartości w punktach interpolacji
yi = interp1(x, y, xi, 'polynomial', coeffs);

% Wykres
plot(x, y, 'o', xi, yi, '-')
legend('Dane wejściowe', 'Interpolacja Newtona')

% efekt ... i jak go zminimalizować (np. węzły Czebyszewa)


