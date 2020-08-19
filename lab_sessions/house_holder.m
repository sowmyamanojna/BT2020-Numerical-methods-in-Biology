% function [A, v, u, H, hist_h, b] = house_holder(A,b)
function x = house_holder(A,b)
    A_plot = A;
    b_plot = b;
    [m,n] = size(A);
    I = eye(m);
    hist_h = eye(m);
    for i = 1:n
        v = A(i:end,i) - norm(A(i:end,i))*I(i:end,i)*decide_sign(A(i:end,i));
        u = v/nrm(v);
        H_new = eye(size(u,1)) - 2*u*u';
        H = eye(m);
        H(i:end, i:end) = H_new;
        hist_h = hist_h*H;
        A = H*A;
        b = H*b;
    end
    
    x = upper_matrix(A(1:n,:),b(1:n));
    
    plot(A_plot*x,b_plot);
    
end