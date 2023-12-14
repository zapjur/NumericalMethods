clear all;
close all;
clc;

x1_45 = 2;
x2_45 = 3;

x1_5 = 1;
x2_5 = 5;

x1_80 = -2;
x2_80 = 1;

a45 = tan(deg2rad(45))/2;
a5 = tan(deg2rad(5))/2;
a80 = tan(deg2rad(80))/2;

f45 = @(x) a45 * (x - x1_45) .* (x - x2_45);
f5 = @(x) a5 * (x - x1_5) .* (x - x2_5);
f80 = @(x) a80 * (x - x1_80) .* (x - x2_80);

fp45 = @(x) 2 * a45 * x - a45 * (x1_45 + x2_45);
fp5 = @(x) 2 * a5 * x - a5 * (x1_5 + x2_5);
fp80 = @(x) 2 * a80 * x - a80 * (x1_80 + x2_80);

x = linspace(-5,5,100);

desZero45 = 2;
desZero80 = 1;
desZero5 = 1;

figure;
subplot(3, 1, 1);
plot(x, f45(x), 'b-', x, fp45(x), 'r-');
title('45 stopni'); xlabel('x'); grid on;
legend('Funkcja', 'Jej pochodna');

subplot(3, 1, 2);
plot(x, f5(x), 'b-', x, fp5(x), 'r-');
title('5-10 stopni'); xlabel('x'); grid on;
legend('Funkcja', 'Jej pochodna');

subplot(3, 1, 3);
plot(x, f80(x), 'b-', x, fp80(x), 'r-');
title('80 stopni'); xlabel('x'); grid on;
legend('Funkcja', 'Jej pochodna');

it=20;
cb45 = nonlinsolvers(f45, fp45, 0, 2.5, 'newton-raphson', it);
cb5 = nonlinsolvers(f5, fp5, 0, 2.5, 'newton-raphson', it);
cb80 = nonlinsolvers(f80, fp80, 0, 2.5, 'newton-raphson', it);

figure;
plot( 1:it,cb45,'o-'); xlabel('iter'); ylabel('cb(iter)');
title("45 deg"); 
figure;
plot( 1:it,cb5,'o-'); xlabel('iter'); ylabel('cb(iter)');
title("5 deg");
figure;
plot( 1:it,cb80,'o-'); xlabel('iter'); ylabel('cb(iter)');
title("80 deg");
tolerance = 0.00001;

if abs(cb80(end)-desZero80) < tolerance
    disp('Osiągnięto wymaganą dokładność dla nachylenia 80');
else
    disp('Nie osiągnięto wymaganej dokładności dla nachylenia 80');
end

if abs(cb45(end)-desZero45) < tolerance
    disp('Osiągnięto wymaganą dokładność dla nachylenia 45');
else
    disp('Nie osiągnięto wymaganej dokładności dla nachylenia 45');
end


if abs(cb5(end)-desZero5) < tolerance
    disp('Osiągnięto wymaganą dokładność dla nachylenia 5');
else
    disp('Nie osiągnięto wymaganej dokładności dla nachylenia 5');
end