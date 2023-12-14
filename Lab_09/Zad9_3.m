clear all; close all; clc;
it = 20;
a = pi - pi/5; b = pi + pi/5;
f = @(x) sin(x);

fp = @(x) cos(x);

tolerance = 0.001 / 100; 
desired_zero = pi;
x = 0:0.01:2*pi;

figure;
plot( x, f(x), 'b-', x, fp(x),'r-'); grid; xlabel('x'); title('f(x), fp(x)');
legend('Funkcja','Jej pochodna'); 
cb = nonlinsolvers( f, fp, a, b, 'regula-falsi', it );
figure;
plot( 1:it,cb,'o-'); xlabel('iter'); ylabel('cb(iter)');
grid on, legend('regula-falsi');
if abs(cb(end) - desired_zero) < tolerance
    disp('Osiągnięto wymaganą dokładność');
else
    disp('Nie osiągnięto wymaganej dokładności');
end
