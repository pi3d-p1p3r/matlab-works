function reducedMatrix = rowReduction(matrix)
    [m, n] = size(matrix);
    reducedMatrix = matrix;
    for i = 1:min(m, n)
    [~, pivotRow] = max(abs(reducedMatrix(i:m, i)));
    pivotRow = pivotRow + i - 1;
    reducedMatrix([i, pivotRow], :) = reducedMatrix([pivotRow, i], :);
    reducedMatrix(i, :) = reducedMatrix(i, :) / reducedMatrix(i, i);
    for j = 1:m
    if j ~= i
    reducedMatrix(j, :) = reducedMatrix(j, :) - reducedMatrix(j, i) * reducedMatrix(i, :);
    end
    end
    end
    end