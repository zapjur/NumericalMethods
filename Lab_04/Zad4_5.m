clear all;
close all;
clc;

matrix = [1,2,3; 3,4,5; 6,6,5];
iterative = (1/det(matrix)) * calculateAdjointMatrixIterative(matrix)
inv(matrix)


%Podejście iteracyjne
function adjointMatrix = calculateAdjointMatrixIterative(A)
    [rows, cols] = size(A);
    adjointMatrix = zeros(rows, cols);

    for i = 1:rows
        for j = 1:cols
            minor = calculateMinor(A, i, j);
            adjointMatrix(j, i) = (-1)^(i+j) * minor;
        end
    end
end

function minorValue = calculateMinor(A, row, col)
    [rows, cols] = size(A);
    minorMatrix = zeros(rows-1, cols-1);
    m = 1;
    for i = 1:rows
        if i ~= row
            n = 1;
            for j = 1:cols
                if j ~= col
                    minorMatrix(m, n) = A(i, j);
                    n = n + 1;
                end
            end
            m = m + 1;
        end
    end
    minorValue = det(minorMatrix);
end
