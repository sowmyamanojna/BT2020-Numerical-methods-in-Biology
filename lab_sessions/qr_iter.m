function eig_val = qr_iter(A)
    for i = 1:10
        [Q,R] = qr(A);
        Q
        R
        A = R*Q;
    end
    A
    eig_val = diag(A)
end
