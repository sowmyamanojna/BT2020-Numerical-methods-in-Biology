% function ar = area
    
    count = 0;
    n = 1000000;
    
    att = 1;
    ar_hist = zeros(1,att);
    
for j = 1:att
    j
    count = 0;
    x_hist = zeros(1,n);
    y_hist = zeros(1,n);
    x_hist_in = zeros(1,n);
    y_hist_in = zeros(1,n);
    x_hist_out = zeros(1,n);
    y_hist_out = zeros(1,n);
    
    count_hist = zeros(1,n);
    
    for i = 1:n
        x = -3 + 6*rand();
        y = 2 - (4 + sqrt(3))*rand();
        
        case1 = (x+1)^2 + y^2 -4;
        case2 = (x-1)^2 + y^2 -4;
        case3 = x^2 + (y+sqrt(3))^2 -4;
        
        x_hist(i) = x;
        y_hist(i) = y;
        
        if (case1 < 0) && (case2 < 0) && (case3 < 0)
            count = count + 1;
            x_hist_in(i) = x;
            y_hist_in(i) = y;
        
        else
            x_hist_out(i) = x;
            y_hist_out(i) = y;
        
        end
        
        count_hist(i) = count/i;        
    end
    
    count_hist = count_hist * 6 * (4 + sqrt(3));
    
    figure()
    plot(x_hist_out(1:count),y_hist_out(1:count),'k.')
    hold on;
    plot(x_hist_in,y_hist_in,'g.')
    viscircles([-1,0],2);
    viscircles([1,0],2);
    viscircles([0, -sqrt(3)],2);
    
    figure()
    plot([1:n], count_hist)    
    
    figure()
    plot(x_hist, y_hist)
   
    ar = (count/n)*6*(4 + sqrt(3))
    ar_hist(j) = ar;
    
end

