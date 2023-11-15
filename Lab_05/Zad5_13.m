clear all; 
close all;
clc;

% Funkcja dokladnie - malymi kroczkami
x = ( -2*pi : 0.01 : 2*pi)';
y = cos(x);
% Wezly - zgrubnie - duze kroki
xk = ( -2*pi : 0.5*pi : 2*pi)';
yk = cos(xk);
% Linear spline
yi = interp1(xk,yk,x,'linear');
figure; plot(x,y,'r',xk,yk,'ko',x,yi,'b.'); xlabel('x'); title('y(x)'); grid;
% Cubic spline
yi = interp1(xk,yk,x,'cubic');
figure; plot(x,y,'r',xk,yk,'ko',x,yi,'b.'); xlabel('x'); title('y(x)'); grid;
% Cubic spline ze Spline Toolbox
cs = spline(x,[0; y; 0]);
yi = ppval(cs,x);
figure; plot(x,y,'r-', xk,yk,'ko', x,yi,'b.-'); xlabel('x'); title('y=f(x)'); grid;
 