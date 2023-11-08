close all;
clear all;
clc;

matrix = [4, 6, 10; 6, 25, 19; 10, 19, 74];

LM = chol(matrix, "lower")
L = myChol(matrix)

matrixBack = L*L'


function L = myChol(A)
    [N, N] = size(A);
    L = zeros(N, N);

    for i = 1:N
        for j = 1:i
            if i == j
                L(i, j) = sqrt(A(i, i) - sum(L(i, 1:j-1).^2));
            else
                L(i, j) = (A(i, j) - sum(L(i, 1:j-1).*L(j, 1:j-1))) / L(j, j);
            end
        end
    end
end