function [x,itSOR] = sor(A, b, omega, tolerance, max_iterations)
    [m, n] = size(A);
    if m ~= n
    error('Coefficient matrix must be square');
    end
    A = make_diagonally_dominant(A);
    x = zeros(n, 1);
    for k = 1:max_iterations
    x_old = x;
    
    for i = 1:n
    sigma = A(i, 1:i-1) * x(1:i-1) + A(i, i+1:end) * x_old(i+1:end);
    x(i) = (1 - omega) * x_old(i) + (omega / A(i, i)) * (b(i) - sigma);
    end
    if norm(x - x_old, inf) < tolerance
    itSOR = k;
    disp(['SOR method converged in ', num2str(k), ' iterations']);
    return;
    end
    end
    error('SOR did not converge within the specified number of iterations');
    end