% Desription of the problem:
% Given a number of students:
% (i)  find the probability that atleast 2 students share birthday
% (ii) find the expected number of students who'll share birthdays

% Function discription:
% (i)  find_probab_birthday:
%      given a number of students, calculate the probability that two share their birthdays         
%      method of approach - mathforum.org/dr.math/faq/faq.birthdayprob.html
%
% (ii) find_number:
%      given a number of students, calculate the number of students who
%      share their birthdays

function [p_share, num] = find_probab_birthday(n) 
    if n > 365
        p_share = 1;
    else
        p_nshare = fact(366-n)/365^n;
        p_share = 1 - p_nshare;
        num = find_number(n);
    end
end
    
function f = fact(n)
    f = 1;
    for i = n:365
        f = f*i;
    end
end

function mean_repeats =  find_number(n)
    sum_repeat = 0;
    for i = 1:10000
        bdays = randi(365,n,1);
        val = bdays;
        
        u_val = unique(bdays);
         repeat= zeros(length(u_val),1);
        for j = 1:length(u_val)
            repeat(j) = sum(u_val(j) == val)*1.0 - 1;
        end
        
        sum_repeat = sum_repeat + sum(repeat);
    end
    
    mean_repeats = round(sum_repeat/10000);
    
end