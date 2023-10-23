clear all
close all
clc

R1 = 10; R2 = 20; R3 = 30; R0 = 40;
E1 = 3;  E2 = 2;  E3 = 1;

A = [  R1-R2,   R2,     0;  ... 
         R2, -R2+R3,   -R3;  ...
           0,   -R3, R3+R0   ],
B = [ E1-E2; ...
      E2-E3; ...
        E3  ],


x1 = inv(A)*B;   % inv(A)  = A^(-1)
x2 = pinv(A)*B;  % pinv(A) = (A^T * A)^(-1) * A^T
x3 = A \ B;      % minimaliacja bledu sredniokwadratowego

% Metoda Cramera
for k=1:length(B)
    Ak = A; Ak(:,k) = B; % (w,k) = (:,k)
    x4(k) = det( Ak ) / det(A); 
end    

x4 = x4.';
[ x1, x2, x3, x4 ], pause


