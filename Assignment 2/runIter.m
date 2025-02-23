A=[4 1 1 0 1;-1 -3 1 1 0;2 1 5 -1 -1;-1 -1 -1 4 0;0 2 -1 1 4];
b=[6;6;6;6;6];
tol = 0.001;
maxi = 100;
omega = 1.4;
[xJ,itJ] = jacobi(A,b,tol,maxi);
[xGS,itGS] = gauss_seidel(A,b,tol,maxi);
[xSOR,itSOR] = sor(A,b,omega,tol,maxi);
table(xJ,xGS,xSOR)