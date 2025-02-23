function [x,itGS] = gauss_seidel(A, b, tolerance, max_iterations)
    [m, n] = size(A);
    A = make_diagonally_dominant(A);
    x = zeros(n, 1);
    for k = 1:max_iterations
    x_old = x;
    
    for i = 1:n
    sigma = A(i, 1:i-1) * x(1:i-1) + A(i, i+1:end) * x_old(i+1:end);
    x(i) = (b(i) - sigma) / A(i, i);
    end
    if norm(x - x_old, inf) < tolerance
    itGS = k;
    disp(['Gauss-Seidel method converged in ', num2str(k), ' iterations']);
    return;
    end
    end
    error('Gauss-Seidel did not converge within the specified number of iterations');
    end