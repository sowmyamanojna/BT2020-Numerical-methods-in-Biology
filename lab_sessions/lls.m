function x = lls(A,b)
    mat = A'*A;
    l = cholesky(mat);
    z = A'*b;
    y = lower_matrix(l,z);
    x = upper_matrix(l',y);
end
