function x = upper_matrix(U, b)
[m, n] = size(U);

x = zeros(n,1);
sum = 0;

for i = 1:m
    if U(i,:) == zeros(1,n)
        sum = sum + 1;
    end
end

if (m - sum) < n
    x = "The set of equations are not solvable";
    return
end


for i = size(U,1):-1:1
      x(i) = (b(i) - U(i,:) * x)/U(i,i);
end
end