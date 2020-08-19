function index = bestFit(x,y)
    x = x(:)
    y = y(:)
    m = size(x,1);
    
    r_squared = zeros(5,1);
    A = zeros(m,5);
    A(:,1) = 1;
    A(:,2) = x;
    A(:,3) = x.^2;
    A(:,4) = x.^3;
    A(:,5) = x.^4;
    
%   A'Ax = A'y
%   is the required solution for the problem - 
%   Solved using House Holder Transformations

%   Code for fitting first degree polynomial
    A1 = A(:,1:2);
    c1 = house_holder(A1,y)
%     x1 = lls(A1,y)

%   Code for fitting second degree polynomial
    A2 = A(:,1:3);
    c2 = house_holder(A2,y)
%     x2 = lls(A2,y)
    
%   Code for fitting third degree polynomial
    A3 = A(:,1:4);
    c3 = house_holder(A3,y)
%     x3 = lls(A3,y)

%   Code for fitting fourth degree polynomial
    A4 = A(:,1:5);
    c4 = house_holder(A4,y)
%     x4 = lls(A4,y)
    
    r1 = y - A1*c1;
    r2 = y - A2*c2;
    r3 = y - A3*c3;
    r4 = y - A4*c4;

    s = sum((y-mean(y)).^2);
    
    r_squared(1) = 1 - (r1'*r1/s);
    r_squared(2) = 1 - (r2'*r2/s);
    r_squared(3) = 1 - (r3'*r3/s);
    r_squared(4) = 1 - (r4'*r4/s);
    r_squared
    
    [max_r_squared, index] = max(r_squared);
    
    min_val = min(x(:))
    max_val = max(x(:))
    x_val = [min_val:0.01:max_val]';
    A_new = [ones(length(x_val),1) x_val x_val.^2 x_val.^3 x_val.^4];
    A1_new = A_new(:,1:2);
    A2_new = A_new(:,1:3);
    A3_new = A_new(:,1:4);
    A4_new = A_new(:,:);
    
    plot(x,y, '--o', 'LineWidth',2)
    hold on;
    plot(x_val,A1_new*c1) %, 'LineWidth',2)
    plot(x_val,A2_new*c2) %, 'LineWidth',2)
    plot(x_val,A3_new*c3) %, 'LineWidth',2)
    plot(x_val,A4_new*c4) %, 'LineWidth',2)
%     
%     plot(x_val,A1_new*x1, 'LineWidth',2)
%     plot(x_val,A2_new*x2, 'LineWidth',2)
%     plot(x_val,A3_new*x3, 'LineWidth',2)
%     plot(x_val,A4_new*x4, 'LineWidth',2)
%     
    legend('Actual value', 'First', 'Second', 'Third', 'Fourth') %'New 1st', 'New 2nd', 'New 3rd', 'New 4th');   
    
end

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

% function c = lls(A,b)
%     [m,n] = size(A)
%     c = normal_solve(A'*A,A'*b)
% end
% 
% function x = normal_solve(A,b)
%     [m,n] = size(A);
%     c_mat = [A b]
%     for j = 1:n
%         for i = j+1:m
%             c_mat(i,:) = c_mat(i,:) - (c_mat(i,j)/c_mat(j,j))*c_mat(j,:)
%         end
%     end
%     A = c_mat(:,1:n)
%     b = c_mat(:,n+1)
%     dim = min(m,n)
%     x = upper_solve(A(1:dim,1:dim), b(1:dim))
% end
% 
% function x = upper_solve(A,b)
%     l = length(A)
%     x = zeros(l,1)
%     for i = l:-1:1
%         x(i) = (b(i) - A(i,:)*x)/A(i,i)
%     end
% end
% 

function val = decide_sign(x)
    val = (x>=0)*-1 + (x<0)*1;
end

function val = nrm(A)
    val = 0;
    val = sum(A(:).^2);
    val = sqrt(val);
end