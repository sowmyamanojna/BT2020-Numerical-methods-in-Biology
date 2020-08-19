function x = normal_solve(A,b)
    [m,n] = size(A);
    c_mat = [A b]
    for j = 1:n
        for i = j+1:m
            c_mat(i,:) = c_mat(i,:) - (c_mat(i,j)/c_mat(j,j))*c_mat(j,:)
        end
    end
    A = c_mat(:,1:n)
    b = c_mat(:,n+1)
    dim = min(m,n)
    x = upper_solve(A(1:dim,1:dim), b(1:dim))
end

function x = upper_solve(A,b)
    l = length(A)
    x = zeros(l,1)
    for i = l:-1:1
        x(i) = (b(i) - A(i,:)*x)/A(i,i)
    end
end