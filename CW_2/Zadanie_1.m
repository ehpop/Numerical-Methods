[A, b] = macierz_1;

x_gauss = gauss(A, b);
x_lu = metoda_LU(A, b);

x_jacobi = jacobi(A, b, ones(size(b)), 1e4, 1e-9);
x_gauss_seidel = gauss_seidel(A, b, ones(size(b)), 1e4, 1e-9);
x_sor = SOR(A, b, ones(size(b)), 1e4, 1e-9, 1.1);

fprintf('----------------------------\n')

print_vec(x_gauss, 'x_gauss')
print_vec(x_lu, 'x_lu')
print_vec(x_jacobi, 'x_jacobi')
print_vec(x_gauss_seidel, 'x_gauss_seidel')
print_vec(x_sor, 'x_sor')

fprintf('----------------------------\n')
