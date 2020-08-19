function x = lower_matrix(L, b)
c_mat = [L b];
x = zeros(size(L,2),1);
[m,n] = size(L);
summation = 0;

for i = 1:m
    if L(i,:) == zeros(1,n)
        summation = summation + 1;
    end
end

if (m - summation) < n
    x = "The set of equations are not solvable";
    return
end

for i = 1:size(L,1)
    x(i) = (b(i) - L(i,:) * x)/L(i,i);
end

end