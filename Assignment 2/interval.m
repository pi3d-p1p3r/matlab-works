T = 1; 
syms t; 
t_values = linspace(sym(T/4), sym(T/8), 10);

tableData = [t_values', sin(t_values)']; 
tableHeaders = {'Interval', 'Solution'};
table(tableData)
