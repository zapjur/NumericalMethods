clear all
close all
clc


% Dane wejsciowe
[x,fpr]=audioread('mowa.wav',[1,2^14]);
N = length(x);
figure; plot(x); title('x(n)');

% Transformacja liniowa/ortogonalna - ANALIZA
n=0:N-1; k=0:N-1;
A = sqrt(2/N)*cos( pi/N *(k'*n));
y = A*x;
figure; plot(y); title('y(k)');

% Modyfikacja wyniku
s = 2000;
e = length(y);
y(s:e,1) = zeros(e-s+1,1);
y(1000) = 0;
figure; plot(y); title('y(k)');

% Transformacja odwrotna - SYNTEZA
xback = A'*y;
figure; plot(xback); title('xback(n)');


length(y)
length(A)
soundsc(x,fpr); pause();
soundsc(y,fpr); pause();
soundsc(xback,fpr);