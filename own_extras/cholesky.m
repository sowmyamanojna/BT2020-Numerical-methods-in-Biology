function l = cholesky(A)
    l = zeros(size(A));
    [m, n] = size(A);
    for i = 1:n
        for j = 1:i
            if (i == j)
                l(i,j) = sqrt(A(i,j) - sum(l(i,:).^2));
            else
                l(i,j) = (A(i,j)-(l(i,:)*l(j,:)'))/l(j,j);
            end
        end
    end
end
