function [x] = metoda_LU(A, b)

[L, U, P] = lu(A);
y = L\(P*b);
x = U\y;

end