function random_uni_circle(R, k)
   
    r = R*sqrt(rand(k,1));
    theta = 2*pi*rand(k,1);
    
    x = r.*cos(theta);
    y = r.*sin(theta);
    
    plot(x,y,'.');
    title("Uniform");    
    axis square;
    
    r1 = R*rand(k,1);
    x1 = r1.*cos(theta);
    y1 = r1.*sin(theta);
    
    figure()
    plot(x1, y1, '.');
    title("Non-Uniform");
    axis square;
    
end