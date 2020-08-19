function [x,A,R] = gram_schmidt(A,b)
    [m,n] = size(A);
    R = zeros(n,n);
    
    for i = 1:n
        for j = 1:i-1      
            R(j,i) = A(:,i)'*A(:,j)/norm(A(:,j));
            A(:,i) = A(:,i) - (A(:,i)'*A(:,j)/norm(A(:,j))^2).*A(:,j);
        end
        R(i,i) = norm(A(:,i));
    end
    
    for i = 1:n
        A(:,i) = A(:,i)/norm(A(:,i));
    end
    b = A'*b;
    x = upper_matrix(R,b);
end