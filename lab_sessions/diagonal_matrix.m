function x = diagonal_matrix(A, b)

x = zeros(n,1);

for i = 1:m
    if U(i,:) == zeros(1,n)
        sum = sum + 1;
    end
end

if (m - sum) < n
    x = "The set of equations are not solvable";
    return
end

for i = 1:size(L,1)
    x(i) = (b(i) - L(i,:) * x)/L(i,i)
end

for i = 1:size(A,1)
    x(i) = b(i)/A(i,i);
end

end