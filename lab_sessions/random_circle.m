% x = [-1:0.0001:1]
X = zeros(10000,1);
Y = zeros(10000,1);

for i = 1:10000
    x = -1 + rand()*2;
    y = -sqrt(1-x^2) + rand()*(2*sqrt(1-x^2));
    X(i) = x;
    Y(i) = y;
end

figure()
plot(X,Y, '.')
daspect([1 1 1])