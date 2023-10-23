clear all
close all
clc

u = [1;2;3];
v = [4;5;6];

A = [1,2,3; 4,5,6; 7,8,9];
B = eye(3);

%%%%%%%%%%%
display("1")
(u') * v
u(1)*v(1) + u(2)*v(2) + u(3)*v(3)

%%%%%%%%%%%
display("2")
u*(v.')
result = zeros(3);
for i=1:length(result)
    for j=1:length(result)
        result(i,j) = u(i) * v(j);
    end
end
result

%%%%%%%%%%%
display("3")
A+B
result = zeros(length(A));
for i=1:length(result)
    for j=1:length(result)
        result(i,j) = A(i,j) + B(i,j);
    end
end
result

%%%%%%%%%%%
display("4")
A*B
result = zeros(length(A));
for i=1:length(result)
    for j=1:length(result)
        for k=1:length(result)
            result(i,j) = result(i,j) + A(i,k) * B(k,j);
        end
   end
end
result

%%%%%%%%%%%
display("5")
(u.')*A
result = [0;0;0];
for i=1:length(result)
    for j=1:length(A)
        result(i) = result(i) + u(j) * A(j,i);
    end
end
result

%%%%%%%%%%%
display("6")
A*u
result = [0;0;0];
for i=1:length(result)
    for j=1:length(A)
        result(i) = result(i) + u(j) * A(i,j);
    end
end
result

%%%%%%%%%%%
display("7")
a = 10;
a*A
result = zeros(length(A));
for i=1:length(result)
    for j=1:length(A)
        result(i,j) = a * A(i,j);
    end
end
result

%%%%%%%%%%%
display("8")
(A+B) * u
bufor = zeros(length(A));
result = [0;0;0];
for i=1:length(bufor)
    for j=1:length(A)
        bufor(i,j) = A(i,j) + B(i,j);
    end
end
for i=1:length(result)
    for j=1:length(bufor)
        result(i) = result(i) + u(j) * bufor(i,j);
    end
end
result

%%%%%%%%%%%
display("9")
inv(A)
display("Wyznacznik jest bliski zera, nie można liczyc macierzy odwrotnej")

%%%%%%%%%%%
display("10")
poly(A)

%%%%%%%%%%%
display("11")
det(A)

%%%%%%%%%%%
display("12")
rank(A)



