% BT2020 Assignment 3
% Roll number : BE17B007
% Collaborators : -
% Time: 30 mins
%
% Function Description: HW3
% HW3 Calculates common area between 3 circles
% 
%   area = HW3
% 
%   Returns the common area (using Monte Carlo simulations), between 
%     o three intersecting circles
%     o centers of each of the three circles lie on two other circles.
%     o radius of each circle is 2 units
% 
%   Co-ordinate system used:
%     o Rectangular 
%     o Region of distribution of random points: Rectangle with vertices - 
%       (-3,-(2 + sqrt(3))), (3,-(2 + sqrt(3))), (-3,2) and (3,2)
%     o Center of circles: (-1,0), (1,0) and (0, -sqrt(3))
% 
%   Number of Monte Carlo Iterations: 10^8
% 
%   Uncommenting the commented lines of code in the function results in the
%   following graphs to be plotted
%     o Graph 1:
%         - Representation of the points inside and outside the desired region
%     o Graph 2:
%         - Change in area calculated vs number of iterations

function area = hw3

    count = 0;
    n = 1000000000;

%     ar_hist = zeros(1,n);
%     x_in = zeros(1,n);
%     y_in = zeros(1,n);
%     x_out = zeros(1,n);
%     y_out = zeros(1,n);

    for i = 1:n
        x = -3 + 6*rand();
        y = 2 - (4 + sqrt(3))*rand();
            
        circle_1 = (x+1)^2 + y^2 -4;
        circle_2 = (x-1)^2 + y^2 -4;
        circle_3 = x^2 + (y+sqrt(3))^2 -4;
    
        if (circle_1 < 0) && (circle_2 < 0) && (circle_3 < 0)
            count = count + 1;
%             x_in(i) = x;
%             y_in(i) = y;
%         else
%             x_out(i) = x;
%             y_out(i) = y;
        end

%         ar_hist(i) = (count*6*(4 + sqrt(3))/i);

    end

%     figure()
%     plot(x_out,y_out,'c.');
%     hold on;
%     plot(x_in,y_in,'y.');
%     viscircles([-1,0],2);
%     viscircles([1,0],2);  
%     viscircles([0,-sqrt(3)],2)
%     title("Points on the Coordinate system")
%     
%     figure()
%     plot([1:n],ar_hist)
%     title("Area Calculated vs Number of Iterations");
%     ylabel("Area calculated");
%     xlabel("Number of Iterations");
   
    area = count*6*(4 + sqrt(3)) / n;
    
end