clear all
close all
clc


a = 4.3;
c = -4.8;
b = -1e+4*(4*a*c);

x1 = (-b - sqrt(b^2 - 4*a*c))/2*a
x2 = (-b + sqrt(b^2 - 4*a*c))/2*a

if abs(x1) > abs(x2)
    
    x21 = 2*c/(-b - sqrt(b^2 - 4*a*c))

else
    x11 = (-b - sqrt(b^2 - 4*a*c))/2*a
end
