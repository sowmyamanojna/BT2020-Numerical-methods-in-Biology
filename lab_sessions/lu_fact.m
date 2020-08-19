function [L, U, y, x] = lu_fact(A, b)
    n = length(A);
%     cmat = [A b]
    
    U = A;
    L = eye(n);
    
    for j = 1:n-1
        for k = j+1:n
            L(k,j) = U(k,j)/U(j,j);
            U(k,:) = U(k,:) - U(k,j) * U(j,:)/U(j,j);
        end
    end 
    
    y = zeros(n,1);
    x = zeros(n,1);
    
    for i = 1:n
        y(i) = b(i) - L(i, 1:i)*y(1:i);
    end
    
    for i = n:-1:1
        x(i) = (y(i) - U(i,i:n)*x(i:n))/U(i,i);
    end
end
