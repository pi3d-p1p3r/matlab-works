function x = jac2(A,b,tol,maxit)
    [m,n] = size(A);
    A = make_diagonally_dominant(A);
    x = zeros(n,1);
    for k = 1:maxit
        xnew = zeros(n,1);
        for i = 1:n
            xnew(i) = x(i) + (b(i) - A(i,:)*x)/A(i,i);
            if(norm(xnew-x,inf))<tol 
                return
            end
        end
        x = xnew;
    end
end