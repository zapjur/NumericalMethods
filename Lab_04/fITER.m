function x = fITER(A,b)

% Metoda Jacobiego

% Zbuduj macierze: D oraz A z wyzerowna przek¹tna (L+U)
[N,N]=size(A);
D = zeros(N,N);
for k=1:N
    D(k,k)=A(k,k);
    A(k,k)=0;
end
U = triu(A); L = tril(A); LU = L+U;
% D, LU, pause

% Iterowanie
Dinv = inv(D);
x1=rand(N,1);
x2=rand(N,1);
while( max(abs(x2-x1)) > 100*eps )  
   x1 = x2;
   x2 = Dinv * (b - LU*x1);
end
x = x2;


