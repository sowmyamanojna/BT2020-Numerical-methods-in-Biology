res = input("Enter the operation that you ant to perform: \n(a) Calclate volume of a sphere \n(b)Measure the error in computing using Taylor series \n(c)Print values of floating points:  ");

if res == "a"
    r = input("Enter the radius of the circle: ");
    
    vol = hw1a(r)
    
elseif res == "b"
    k = input("Enter the number of terms till which you want to compute the taylor series: ")
    
    val = hw1b(k)
    
    val_till_ten = zeros(10)
    for i = 1:10
        val(i) = hw1b(i)    
    end
    
else
    hw1c(l)
end
