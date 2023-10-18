clear all;
close all;
clc;
format long;

fq = 20;
pFq = 192000;
sAngle = 0;
iterations = 20000;

omega = 2*pi*fq/pFq;

a = 2*cos(omega)

y = [sin(sAngle + omega), sin(sAngle + 2*omega)];
x = zeros(1, iterations);

x(2) = omega;

for i=3:iterations
    y(i) = a*y(i-1) - y(i-2);
    x(i) = x(i-1) + omega;
end

plot(x,y);
xlabel("Radiany");
ylabel("sin(x)");
grid;