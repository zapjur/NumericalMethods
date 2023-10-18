clear all
close all
clc

%metoda 1

x = realmin('single');
n = 0;
num2bitstr(x);
while(x < realmax('single'))
    n = n+1;
    x = x*2;
end

n = n+2;
nbits = log2(n)

%metoda 2

x = single(1);
n = 0;

num2bitstr(x)
while( 2*x > x)
    n =n+1;
    x =2*x;
end

nbits = log2(n) + 1

%metoda 3

x = single(1);
n = 1;
bityMantysy = 23;
num2bitstr(x);
while( x/2 < x)
    n=n+1;
    x=x/2;
end
n = n - bityMantysy;
nbits = log2(n) + 1