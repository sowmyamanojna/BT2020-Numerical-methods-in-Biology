%file to save the freaking matrix A and b

A = zeros(5,3);
A(:,1) = 1;
A(:,2) = [-1 -0.5 0 0.5 1]';
A(:,3) = A(:,2).^2;

b = [1 0.5 0 0.5 2.0]';