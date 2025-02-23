function A = make_diagonally_dominant(A)
    for i = 1:size(A, 1)
    [~, maxRowIndex] = max(abs(A(i:end, i)));
    maxRowIndex = maxRowIndex + i - 1;
    A([i, maxRowIndex], :) = A([maxRowIndex, i], :);
    end
    end