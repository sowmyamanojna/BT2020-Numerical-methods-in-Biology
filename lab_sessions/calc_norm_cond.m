function calc_norm_cond(a)
n = norm(a);
ni = norm(inv(a));
con = cond(a);
norm(a)*cond(a);
fprintf("Norm: %g\n", n)
fprintf("Norm_inv: %g\n", ni)
fprintf("Cond: %g\n", con)
end
