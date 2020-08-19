function val = nrm(A)
    [m,n] = size(A);
    val = 0;
    
    for i = 1:m
        for j = 1:n
            val = val + A(i,j)^2;
        end
    end
    
    val = sqrt(val);
end