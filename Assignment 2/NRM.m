function[xi,it] = NRM(e,T,t,y)

    syms x;
    xi = [];
    it = [];
    dy_dx = diff(y, x);

    y_func = matlabFunction(y);
    dy_dx_func = matlabFunction(dy_dx);

    x0 = 0;

    maxIterations = 100;
    tolerance = 1e-10;

    for n = 1:maxIterations
        y_x0 = y_func(x0);
        dy_dx_x0 = dy_dx_func(x0);

        x_next = x0 - y_x0 / dy_dx_x0;
        xi = [xi x_next];
        it = [it n];

        if abs(x_next - x0) < tolerance
            disp(['Converged to solution: x = ', num2str(x_next)]);
            break;
        end

        x0 = x_next;
    end

    if n == maxIterations
        disp('Maximum iterations reached. The method did not converge.');
    end
    plot(it, xi);
end