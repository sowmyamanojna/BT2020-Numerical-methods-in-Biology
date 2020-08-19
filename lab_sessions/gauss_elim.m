function [M, b, x] = gauss_elim(M, b)
[m, n] = size(M);   %get the size of the matrix
c_mat = [M b];      %concatenate the two matrices

for j = 1:n-1
    for k = j+1:m
        c_mat(k,:) = c_mat(k,:) - c_mat(k,j)*c_mat(j,:)/c_mat(j, j);
        %get the kth row
        %subtract it by (the row which has the 1st non-zero element * multiplicative factor)
        %multiplicative factor = 1st non zero #/diag element in that row
    end
end

M =  c_mat(:, 1:n);
b = c_mat(:,n+1);
x = upper_matrix(M, b);
end