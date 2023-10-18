clear all;
close all;
clc;
format long;

syms a b c x;

f = (-b-sqrt(b^2 - 4*a*c))/2*a;

df_db = diff(f, b);
simplify(b*df_db/f)



a = 0.5;
b = 1;
c = 0.5;

cond = b/(sqrt(b^2 - (4*a*c))); % dzielenie przez 0 -> wynik - inf

a = 0.5;
c = 0.5;
b = 1+0.001*randn(1,1000);

xArr = [];
condxArr = [];

for i = 1:1000
    x1 = (-b(i) - sqrt(b(i)^2 - 4*a*c))/2*a;
    condx = b(i)/(sqrt(b(i)^2 - 4*a*c));
    xArr(end+1) = x1;
    condxArr(end+1) = condx;
end

display("Srednia x: " + mean(xArr))
display("Odchylenie x: " + std(xArr))
display("Srednia uwarunkowana: " + mean(condxArr))
display("Odchylenie uwarunkowane: " + std(condxArr))