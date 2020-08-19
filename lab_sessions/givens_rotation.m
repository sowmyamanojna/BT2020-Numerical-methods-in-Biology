function x = givens_rotation(A,b)
    [m,n] = size(A);
    
    for j = 1:n
        for i = m:-1:j+1
            G = eye(m,m);
            a1 = A(i-1,j);
            a2 = A(i,j);
            s = (a2/sqrt(a1^2 + a2^2));
            c = (a1/sqrt(a1^2 + a2^2));
            G(i-1:i,i-1:i) = [c s; -s c];
            A = G*A;
            b = G*b;
        end
    end
    
    x = upper_matrix(A(1:n,:), b(1:n))
end