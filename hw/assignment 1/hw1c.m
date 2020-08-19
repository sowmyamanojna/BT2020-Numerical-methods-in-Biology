% BT2020 Assignment 1c
% Roll number : BE17B007
% Collaborators : -
% Time: 10 mins

function hw1c(e, f)
    format long
    
    l = -(2^(e-1) - 2);                     % calculating lower limit (L)
    u = 2^(e-1) - 1;                        % calculate upper limit (U)

    smallest = 2^l;                         % smallest normalised number
%     largest = 2^(u+1) - 2^(u-f) 
    largest = 2^u*(2 - 2^(-f));             % largest normalised number
    epsilon = 2^(l-f);                      % smallest denormalised number
    
    fprintf("Realmin: 2^{%d} \n", l)
    fprintf("Realmax: 2^{%d}*(2 - 2^{%d}) \n", u, -f)
    fprintf("Eps (0): 2^{%d} \n", l-f)
    
%     fprintf("Realmin: %e \n", smallest)
%     fprintf("Realmax: %e \n", largest)
%     fprintf("Eps (0): %e \n", epsilon)
    
end