clear all;
close all;
clc;

A = [2, -1, 1; -3, 3, 6; 1, 1, 3];
b = [5; -6; 9];

A = A + 0.01 * randn(size(A));

x1 = inv(A) * b 
x2 = A \ b 
x3 = pinv(A) * b 
bhat = A * x1 
err = max(abs(x1 - x2)) 

xd = fITER(A,b)