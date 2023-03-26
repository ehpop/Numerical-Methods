%[A, b] = macierz_1;

% Parametry
max_iter = 1e4;
tol = 1e-4;
omega_vals = linspace(0.1, 1.9, 18);
x0 = ones(size(b));

% Metoda Jacobiego
disp('-------------');
disp("Metoda Jacobiego:");
[x, iter] = jacobi(A, b, x0, max_iter, tol);
residual_norm = norm(b - A*x, 1);
disp(['liczba iteracji: ' num2str(iter) ', norma residualna: ' num2str(residual_norm)]);

% Metoda Gaussa-Seidla
disp('-------------');
disp("Metoda Gaussa-Seidla:");
x0 = ones(size(b));
[x, iter] = gauss_seidel(A, b, x0, max_iter, tol);
residual_norm = norm(A*x - b, 1);
disp(['liczba iteracji: ' num2str(iter) ', norma residualna: ' num2str(residual_norm)]);

% Promien spektralny
disp('-------------');
disp("Promien spektralny:");
rho_jacobi = max(abs(eig(jacobi_matrix(A))));
rho_gauss_seidel = max(abs(eig(gauss_seidel_matrix(A))));
disp(['Metoda Jacobiego, rho = ' num2str(rho_jacobi)]);
disp(['Metoda Gaussa-Seidla, rho = ' num2str(rho_gauss_seidel)]);

% Metoda SOR
iter_values = [];
disp('-------------');
disp("Metoda SOR:");
for omega = omega_vals
    x0 = ones(size(b));
    [x, iter] = SOR(A, b, x0, max_iter, tol, omega);
    iter_values(end + 1) = iter;
    residual_norm = norm(A*x - b, 1);
    disp(['omega = ' num2str(omega) ', liczba iteracji: ' num2str(iter) ', norma residualna: ' num2str(residual_norm)]);
end

plot(omega_vals, iter_values, 'redx-');
set(gca, 'YScale', 'log');
xlabel('omega');
ylabel('liczba iteracji');