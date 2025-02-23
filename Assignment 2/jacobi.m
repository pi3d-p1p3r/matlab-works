function [x,itJ] = jacobi(A, b, tolerance, max_iterations)
    [m,n] = size(A);
    A = make_diagonally_dominant(A);
    x = zeros(n, 1);
    for k = 1:max_iterations
    x_new = zeros(n, 1);
    for i = 1:n
    x_new(i) = x(i) + (b(i) - A( i , : ) * x ) / A(i, i);
    end
    if norm(x_new - x, inf) < tolerance
    disp(['Jacobi method converged in ', num2str(k), ' iterations']);
    itJ = k;
    return;
    end
    x = x_new;
    end
    error('Jacobi did not converge within the specified number of iterations');
    end
    