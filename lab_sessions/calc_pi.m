function pi_val = calc_pi(n)
%
% CALC_PI:
% This function can be used to ge an approximate estimate of the value pi.
% The function uses MONTE CARLO method of calculating pi
% "Throwing darts on a board" method is used to get the estimate of pi.
% The size of the board is 1*1 which circumscribes a circle of diameter 1
% Probability that the dart lands in the circle is calculated
%
%   INPUT:  - n       (Number of iteration the random number generator runs)
%   OUTPUT: - pi_val  (Estimated approximate value  of pi)
%


    count = 0;
    pi_values = zeros(n,1);
    
    for i = 1:n
        X = rand(1000,1);
        Y = rand(1000,1);
        count = sum(X.^2+Y.^2 <= 1);
        pi_val = (count/1000)*4;
%         pi_values(i) = sum(pi_values + pi_val)/i;
        pi_values(i) = pi_val;
    end
    
    plot([1:i], pi_values(1:i))
    pi_val = mean(pi_values);
    
end