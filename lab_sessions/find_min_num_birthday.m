function n = find_min_num_birthday
    p_share = 0;
    i = 2;
    while p_share < 0.50
        p_nshare = fact(366-i)/365^i;
        p_share = 1 - p_nshare;
        i = i+1;
    end    
    n = i-1;
end

function f = fact(n)
    f = 1;
    for i = n:365
        f = f*i;
    end
end