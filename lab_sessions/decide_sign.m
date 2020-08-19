function val = decide_sign(A)
    if A(1,1) > 0
        val = -1;
    else
        val = 1;
    end
end
