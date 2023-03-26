function p = interpolacja_newtona(x, y, xx)
% x - wektor punktów x
% y - wektor punktów y
% xx - wektor wartości x, dla których należy obliczyć wartości p

% Wyznaczenie współczynników interpolacyjnych
c = zeros(length(x), length(x));
c(:,1) = y';
for j=2:length(x)
    for i=j:length(x)
        c(i,j) = (c(i,j-1)-c(i-1,j-1))/(x(i)-x(i-j+1));
    end
end

% Wyznaczenie wartości p dla każdego elementu xx
p = zeros(size(xx));
for k=1:length(xx)
    p(k) = c(1,1);
    for j=2:length(x)
        tmp = 1;
        for i=1:j-1
            tmp = tmp.*(xx(k)-x(i));
        end
        p(k) = p(k) + c(j,j)*tmp;
    end
end

end
