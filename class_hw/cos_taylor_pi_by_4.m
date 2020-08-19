syms x;
y = inline('sin(x)', 'x');

deriv = inline(diff(y(x), 'x'), 'x');

y_diff = zeros(6,1);
y_diff_function = zeros(6, 1);

y_diff(1) = deriv(pi/4)
y_diff_function(1) = deriv
