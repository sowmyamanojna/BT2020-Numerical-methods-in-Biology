function count = integrate

    a = 0;
    b = 4*pi;
    
    iter = 1000;
    count = 0;
    k = 100;
    
    for i = 1:iter
        y = -1 + 2*rand(k,1);
        x = a + (b - a)*rand(k,1);
    
        sum_plus = sum(((sin(x) - y) >= 0).*(y >= 0));
        sum_mins = sum(((y - sin(x)) >= 0).*(y <0));
        
        count = (sum_plus - sum_mins)/k;
        
        figure(1)
        plot(i,count,'b.');
        hold on;
        axis square;
        
        figure(2)
        plot(x,y,'b.');
    end    
    
    figure(2)
    hold on;
    
end