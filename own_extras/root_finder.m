function r = root_finder(p)
    n =  length(p) - 1
    A = diag(ones(n-1,1),-1)
    A(1,:) = -p(2:n+1)./p(1)
    r = eig(A)
end
