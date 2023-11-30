clear all;
close all;
clc;
display("--------------------SINUS---------------------");
x=[0, pi/4, pi/2];
h=pi/4;
y=sin(x);
f_x1=(1/(2*h))*(-3*y(1)+4*y(2)-y(3));
f_x2=(1/(2*h))*(y(3)-y(1));
f_x3=(1/(2*h))*(y(1)-4*y(2)+3*y(3));
y_diff_newton=[f_x1, f_x2, f_x3];
y_diff=cos(x);
display("Błędy przybliżeniowe: ");
for n=1:3
    display(abs(y_diff(n)-y_diff_newton(n)));
end

clear all;
display("---------------------2 STOPIEŃ---------------------");
x=[1, 2, 3];
h=1;
y=0.5+x+2*x.^2;
f_x1=(1/(2*h))*(-3*y(1)+4*y(2)-y(3));
f_x2=(1/(2*h))*(y(3)-y(1));
f_x3=(1/(2*h))*(y(1)-4*y(2)+3*y(3));
y_diff_newton=[f_x1, f_x2, f_x3];
y_diff=4*x+1;
display("Błędy przybliżeniowe: ")
for n=1:3
    display(abs(y_diff(n)-y_diff_newton(n)));
end

clear all;
display("---------------------3 STOPIEŃ-----------------------");
x=[1, 2, 3];
h=1;
y=0.5+x+2*x.^2+3*x.^3;
f_x1=(1/(2*h))*(-3*y(1)+4*y(2)-y(3));
f_x2=(1/(2*h))*(y(3)-y(1));
f_x3=(1/(2*h))*(y(1)-4*y(2)+3*y(3));
y_diff_newton=[f_x1, f_x2, f_x3];
y_diff=9*x.^2+4*x+1;
display("Błędy przybliżeniowe: ")
for n=1:3
    display(abs(y_diff(n)-y_diff_newton(n)));
end


