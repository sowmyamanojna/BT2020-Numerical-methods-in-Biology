% BT2020 Assignment 1b
% Roll number : BE17B007
% Collaborators : -
% Time: 7 mins

function hw1b(x, k)
                                                % Declaration of arrays to store
    values = zeros(10, 1);                      % Taylor sum Values
    abs_error = values;                         % Absolute Error Values
    rel_error = values;                         % Relative Error Values
    
    % loop to get taylor sum values for k = 1 to k = 10
    for i = 1:10
        values(i) = calc_taylor(pi/6, i);
    end
    
    % calculation of absolute and relative errors
    abs_error = values - sin(pi/6);
    rel_error = abs_error/sin(pi/6);
    
    % creation of a tabble to print the values neatly
    varNames = {'Terms', 'Relative_Error'};
    table([1:10]', rel_error, 'VariableNames', varNames)
    
    % Value of Taylor sum till k-th term
    val = calc_taylor(x, k);
    fprintf("\nTaylor Series sum till %d-th term for x = %f : %f \n", k, x, val)
    
end

% Function to calculate the Taylor sum till k-th Term for a given x
function sum = calc_taylor(x, k)
    sum = 0;
    flag = 0;                                       % flag is used to control the sign of a given term
    
    % this loop is used to jump every alternate term 
    % and calculate the summation
    
    for i = 2:2:k
        sum = sum + x^(i-1)/fact(i-1)*(-1)^flag;
        flag = (flag == 0)*1 + (flag == 1)*0;
        % resetting the value of flag and hence controlling sign
        % if    flag == 0 ------> flag = 1
        % else  flag == 1 ------> flag = 0
    end
    
end

% Function to calculate the factorial of a number
function f = fact(x)
    f = 1;
    for i = 1:x
        f = f*i;
    end
end