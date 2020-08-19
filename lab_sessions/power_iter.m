function [l, num_iter] = power_iter(A, x)
    tol = 10^-100;
    lam_max = max(eig(A));
    B = eye(size(A));
    num_iter = 0;
    A_new = A;
    B_new = B;
    while (abs(norm(A_new*x)/norm(B_new*x) - lam_max) > tol)
        A_new = A_new*A;
        B_new = B_new*A;
        num_iter = num_iter + 1;
    end
    l = norm(A_new*x)/norm(B_new*x);
end
