% BT2020 Assignment 2b
% Roll number : BE17B007
% Collaborators : -
% Time: 10 mins
%
% Funciton Descriptions:
% (i)   bestFit:
%       o INPUT: x, y
%       o RESULT: 
%             Coefficients and R^2 value of the polynomial function that best fits
%             the given values of x and y
%       o Working:
%             Given values of x and y, the function uses House Holder Transformations to solve
%             for the optimal values of the polynomial coefficients
%
% (ii)  house_holder:
%       o INPUT: A,b
%       o OUTPUT: x (coefficient matrix)
%       o Result: Calculates the best coefficients that fit the data given A and b
%       (The function is called from the function bestFit)
%
% (iii) upper_matrix
%       o INPUT: A,b
%       o OUTPUT: x
%       o Result: Returns the values of x which satisfies Ax = b
%       (The function is called from the function house_holder)
%                         
% (iv)  decide_sign
%       o INPUT: x
%       o OUTPUT: val (either -1 or 1)
%       o Result: This function is used to reduce the overall cancellations 
%                 while performing House Holder Transformations
%       (This function is called from the function house_holder)
%
% (v)   nrm
%       o INPUT: x
%       o OUTPUT: val (norm of the vector x)
%       o Result: This function calculates the 2-norm of a vector
%       (This function is called from the function house_holder)
              


function hw2b
    values = csvread("data.csv",1);
    x = values(:,1);
    y = values(:,2);
    bestFit(x,y);
end

function bestFit(x,y)
    m = size(x,1);   
    r_squared = zeros(3,1);
    A = zeros(m,5);
    A(:,1) = 1;
    A(:,2) = x;
    A(:,3) = x.^2;
    A(:,4) = x.^3;
    A(:,5) = x.^4;   
    s = sum((y-mean(y)).^2);
    
    for i = 3:5
        A_new = A(:,1:i);
        c{i-2} = house_holder(A_new,y);
        r = y - A_new*c{i-2};
        r_squared(i-2) = 1 - (r'*r/s);
    end
            
    [max_r_squared, index] = max(r_squared);
    index = index + 1;
    fprintf("Best fit => %d degree \n", index);
    fprintf("R^2 = %g\n", r_squared(index-1))
    string = "Coeff = [";
    for j = 1:i-1
        string = string + "%g, ";
    end
    string = string + " %g] \n";
    fprintf(string, c{index-1})
    
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

function val = decide_sign(x)
    val = (x>=0)*-1 + (x<0)*1;
end

function val = nrm(A)
    val = 0;
    val = sum(A(:).^2);
    val = sqrt(val);
end