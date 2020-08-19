response = input("Enter the type of matrix you wnat to solve: \n [d] for Diagonal matrix \n [u] for Upper Triangle \n [l] for Lower Triangular \n [n] for a normal matrix:  ", 's');

if response == "d"
    A = input("Enter the diagonal matrix A: ");
    b = input("Enter the corresponding values: ");

    x = diagonal_matrix(A, b)

elseif response == 'u'
    U = input("Enter the Upper Triangular matrix: ");
    b = input("Enter the corresponding values: ");
    
    x = upper_matrix(U, b)
    
elseif response == 'l'
    L = input("Enter the Lower Triangular matrix: ");
    b = input("Enter the corresponding values: ");
    
    x = lower_matrix(L, b)
elseif response == 'n'
    M = input("Enter the normal matrix: ");
    b = input("Enter the corresponding values: ");
    
    x = gauss(M, b)
else
    "Enter a valid input"
end