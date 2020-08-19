function [x, l] = cholesky(A, b)
%
% CHOLESKY:
% This function can be used to calculate the solution of Ax = b
% The matrix A should be POSITIVE DEFINITE and SYMMETRIC
%
%   INPUT:  - A (Matrix)
%           - b (Row vector)
%   OUTPUT: - L (Lower Triangular matrix, such that A = L*L')
%           - x (Solution for the equation Ax = b)
%

    l = zeros(size(A));
    [m, n] = size(A);
    for i = 1:n
        for j = 1:i
            if (i == j)
                l(i,j) = sqrt(A(i,j) - sum(l(i,:).^2));
            else
                l(i,j) = (A(i,j)-(l(i,:)*l(j,:)'))/l(j,j);
            end
        end
    end
    y = lower_matrix(l,b);
    x = upper_matrix(l',y);
end
