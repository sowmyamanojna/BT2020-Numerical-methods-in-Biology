function fit_circle(x,y)
    x = x(:);
    y = y(:);
    
    A = [x.^2+y.^2 -2*x -2*y ones(size(x))];
%     A = x;
    b = y;
    
% need to solve Ax = b          House holder
    [m n] = size(A);
    for i = 1:n
        I = eye(m-i+1);
        v = A(i:end,i) - norm(A(i:end,i))*determine_sign(A(i,i))*I(:,1);
        u = v/norm(v);
        I = eye(length(u));
        H = I - 2*u*u';
        
        H_new = eye(m);
        H_new(i:end,i:end) = H;
        A = H_new*A;
        b = H_new*b;
    end
    A(1:4,:)
    b(1:4,:)
   
    c = upper_matrix(A(1:4,:),b(1:4));
       
    
    a = b(1)
    b1 = b(2)
    b2 = b(3)
    c = b(4)
    
    x_val = b1/a
    y_val = b2/a
    radius = sqrt((b1^2 + b2^2)/a^2 - c/a)
    
    viscircles([x_val, y_val],radius);
    hold on;
    plot(x,y,'*');

%     plot(x(:,2),y, 'r*');
%     hold on;
%     plot(x(:,2),x*c);        
%     axis square;
    
end


function val = determine_sign(x)
    val = (x>=0)*-1 + (x<0)*1;
end

function val = nrm(x)
    x = x(:);
    val = sqrt(sum(x.^2));
end
