clear all;
close all;
clc;

A = [2, -1, 1; -3, 3, 6; 1, 1, 3];
b = [5; -6; 9];

[L, U] = lu(A);

y = L \ b;
x = U \ y
