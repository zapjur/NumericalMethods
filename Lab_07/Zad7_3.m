clear all;
close all;
clc;

N = 1000;
x = sin(2*pi/N* (0:N-1));
x=x+0.1*randn(1,N);

d = @(x, k, N) (x(1+k:N) -x(1:N-k))/k;
dxMatlab = gradient(x);
dx2Matlab = gradient(dxMatlab);

bestKFordx = 1000000000;
bestErrFordx = 100000000000;
bestKFordx2 = 1000000000;
bestErrFordx2 = 100000000000;
for k = 1:100
    dx = d(x, k, N);
    dx2 = d(dx, k, N-k);

    len = min(length(dxMatlab), length(dx));
    err = norm(dxMatlab(1:len) - dx(1:len));
    if err < bestErrFordx
        bestKFordx = k;
        bestErrFordx = err;
    end
    err=0;
    len = min(length(dx2Matlab), length(dx2));
    err = norm(dx2Matlab(1:len) - dx2(1:len));
    if err < bestErrFordx2
        bestKFordx2 = k;
        bestErrFordx2 = err;
    end
end

display(bestKFordx);
display(bestErrFordx);

display(bestKFordx2);
display(bestErrFordx2);