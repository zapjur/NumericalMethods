clear all;
close all;
clc;

matrix = [3,2,8,9; 6,8,9,3; 5,8,8,6; 3,5,7,8];
iterative = (1/det(matrix)) * calculateAdjointMatrixIterative(matrix)
inv(matrix)
rec = (1/det(matrix))* calculateAdjointMatrixRec(matrix, zeros(size(matrix)), 1, 1)

%Podejście rekurencyjne
function adjointMatrixF = calculateAdjointMatrixRec(matrix, adjointMatrix, i, j)
    [rows, cols] = size(matrix);

    minor = calculateMinorRec(matrix, i, j);
    adjointMatrix(j, i) = (-1)^(i+j) * minor;
    
    if(i >= rows && j >= cols)
        adjointMatrixF = adjointMatrix;
    elseif(j >= cols)
        adjointMatrixF = calculateAdjointMatrixRec(matrix, adjointMatrix, i+1, 1);
    else
        adjointMatrixF = calculateAdjointMatrixRec(matrix, adjointMatrix, i, j+1);
    end
end

function minorMatrix = calculateMinorRec(A,row, col)

    minorMatrix = det(A([1:row-1, row+1:end], [1:col-1, col+1:end]));

end

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
