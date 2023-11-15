clear all;
close all;
clc;

% Funkcja interpolowana wielomianem i jej parametry
N = 20; % liczba znanych punktow funkcji, u nas sinus()
xmax = 2; % maksymalna wartosc argumentu funkcji
xp = 0.1 : xmax/(N-1) : xmax; % wartosci argumentow dla znanych wartosci funkcji
xd = 0.1 : 0.001 : xmax; % wartosci argumentow w punktach interpolacji
yp = log10( xp ); % znane wartosci
yd = log10( xd ); % wartosci w punktach interpolacji - do sprawdzenia
figure;
plot( xp, yp, 'ro', xd, yd, 'b-'); xlabel('x'); title('y(x)'); grid; 
% Wspolczynniki wielomianu y(x) = a0 + a1*x^1 + a2*x^2 + ... + aP*x^P
P = N-1; % rzad wielomianu: 0 (a0), 1 (a0 + a1*x), 2 (a0 + a1*x + a2*x^2), ...
a = polyfit( xp, yp, P ), % obliczenie wsp. wielomianu interpolujacego
% Interpolacja funkcji w zadanych punktach xi
xi = xd; % argumenty punktow interpolacji
yi = polyval(a,xi); % wartosci w punktach interpolacji
a = a(end:-1:1), % w Matlabie wsp. sa zapisywane od najwyzszej potegi
yi_moje = zeros(1,length(xi));
for k = 1 : N % sami obliczamy wartosci w punktach interpolacji
yi_moje = yi_moje + a(k) * xi.^(k-1);
end
max_abs_yi = max( abs( yi - yi_moje) );
figure;
plot( xp,yp,'ro', xd,yd,'b-', xi,yi,'k-' ); xlabel('x'); title('y(x)'); grid; 
figure;
plot( xd, yd-yi, 'k-' ); xlabel('x'); title('BLAD INTERPOLACJI NR 1'); grid; 
% Funkcja interpolacji w Matlabie - interp1()
yis = interp1( xp, yp, xi, 'spline' );
figure;
plot( xp,yp,'ro', xd,yd,'b-', xi,yi,'k-', xi,yis,'k--' );
xlabel('x'); title('y(x)'); grid; 
figure;
plot( xd, yd - yis, 'k-' ); xlabel('x'); title('BLAD INTERPOLACJI NR 2'); grid;
