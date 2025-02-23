function[xi,it] = FixedPoint(e,T,t,y)

    syms x;
    xi = [];
    it = [];
    g(x) = y + e*sin(x) + (2*pi*t)/T;

    g_func = matlabFunction(g);

    x0 = 1;

    maxIterations = 100;
    tolerance = 1e-10;

    for n = 1:maxIterations
        x_next = g_func(x0);
        xi = [xi x_next];
        it = [it n];

        if abs(x_next - x0) < tolerance
            disp(['Converged to solution: x = ', num2str(x_next)]);
            break;
        end

        x0 = x_next;
    end
end