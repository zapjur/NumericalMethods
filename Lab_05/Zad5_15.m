clear all; 
close all;
clc;

% Funkcja dokladnie - malymi kroczkami
x = ( -5 : 0.01 : 5)';
y = 1 ./ (1+x.^2); %definicja funkcji do interpolacji

%y=sin(x);
% Wezly - zgrubnie - duze kroki

xk = ( -5 : 1 : 5)';%węzły interpolacyjne
yk = 1./(1+xk.^2);

%yk=sin(xk);

yll=zeros(length(x),1); %wektor przechowujący wartość interpolowanej funkcji dla osi x
a=0;
llen=x(length(x))-x(1); %różnica między ostation i pierwszym elementem wekotra x(długość orzedziału)
j=1;
solve=zeros(4*(length(xk)-1),4*(length(xk)-1)); %inicjalizacje zmiennych(tablice)
hektor=zeros(4*(length(xk)-1),1); %solve zbiera równania interpolacyjne dla poszczególnych przedziałów
for i=1:length(xk)-2
   x2=xk(i+1); %węzły x1 i x2
   x1=xk(i);
   macrz=[x1^3,    x1^2,  x1^1,  1,  0,       0,     0,  0;
          x2^3,    x2^2,  x2^1,  1,  0,       0,     0,  0;
          3*x2^2,  2*x2,     1,  0, -3*x2^2, -2*x2, -1,  0; %macirz zawierająca współczynniki dla wielomianów 3 stopnia, każdy wiersz to jedno równanie
          6*x2^1,  2,        0,  0, -6*x2^1, -2,     0,  0];
   plus=4*(i-1);
   solve(1+plus:4+plus,1+plus:8+plus)=macrz;
   hektor(1+plus:4+plus)=[yk(i),yk(i+1),0,0];
end
solveLen=length(solve);
solve(solveLen-3:solveLen-2,solveLen-3:solveLen)=[xk(length(xk)-1)^3,  xk(length(xk)-1)^2, xk(length(xk)-1)^1, 1;
                                                 xk(length(xk))^3,    xk(length(xk))^2,   xk(length(xk))^1,   1];
solve(solveLen,1:4)=[6*xk(1),2,0,0];
solve(solveLen-1,length(solve)-3:solveLen)=[6*xk(length(xk)),2,0,0];
hektor(solveLen-3:solveLen)=[yk(length(yk)-1),yk(length(yk)),0,0];
%solced=zeros(4*(length(xk)-1),4*(length(xk)-1));
det(solve)
N=length(solve);
Mnory=zeros(N);
for i=1:N
   for j=1:N
       minor = solve;
       minor(i,:) = [];
       minor(:,j) = [];
       Mnory(i,j)=det(minor)*(-1)^(i+j);
   end
end
solved=transpose(Mnory)/det(solve)
%solved=Fll(solve,1);
leters = solved*hektor;
j=1;
for i=2:length(xk)
   plus=4*(i-2);
   for jj=xk(i-1):0.01:xk(i)
       yll(j)= leters(1+plus)*x(j)^3 + leters(2+plus)*x(j)^2 + leters(3+plus)*x(j)^1 + leters(4+plus)*x(j)^0;
       j=j+1;
   end
   j=j-1;
end
figure; plot(x,y,'r',xk,yk,'ko',x,yll,'b.'); xlabel('x'); grid;
% Cubic spline
yi = interp1(xk,yk,x,'cubic');
figure; plot(x,y,'r',xk,yk,'ko',x,yi,'b.'); xlabel('x'); title('y(x)'); grid;
