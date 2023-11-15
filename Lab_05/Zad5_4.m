clear all; 
close all;
clc;
x = [-6,-4,-3, -1, 1, 3, 4, 6]; y = [1,1,1,1, 1, 1, 1,1]; % zadane punkty = wezly
xi = [-6: 0.1 : 6]; % gdzie obliczyc nowe wartosci funkcji
[yi,a] = funTZ_lagrange(x,y,xi); % nasza funkcja interpolujaca
yii = polyval(a,xi); % oblicz wartosci wielomianu "a" w punktach "xi"
a, % obliczone wsp. wielomianu: aN,...,a1,a0
figure; plot(x,y,'ro',xi,yi,'b-',xi,yii,''); title('y=f(x)'); % rysunek
  