function x = house_holder(A,b)
    [m,n] = size(A);
    Q = eye(m);
    for i = 1:n
        I = eye(m);
        v = A(i:end,i) - decide_sign(A(i,i))*nrm(A(i:end,i))*I(i:end,i);
        u = v/nrm(v);
        
        I(i:end,i:end) = I(i:end,i:end) - 2*u*u';
        A = I*A;
        b = I*b;
    end
    
    x = upper_matrix(A(1:n,:),b(1:n));

end    

function x = upper_matrix(A,b)
    [m,n] = size(A);
    x = zeros(n,1);
    for i = n:-1:1
        x(i) = (b(i) - A(i,:)*x)/A(i,i);
    end        
end

function val = decide_sign(x)
    val = (x>=0)*-1 + (x<0)*1;
end

function val = nrm(A)
    val = 0;
    val = sum(A(:).^2);
    val = sqrt(val);
end

