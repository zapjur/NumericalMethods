% bity_mantysy.m
clear all; close all; clc;

e=1/2; n=0;           % inicjalizacja
while( (1+e) > 1 )    % czy "widac" dodanie "e"  
   e=e/2; n=n+1;      % jesli tak, to zmniejsz "e" 2 razy
end                   %
nbits = n,            % szukana liczba bitow mantysy


e = single(1/2); n = 0;
while((1+e) > 1)
    e = e/2; n = n+1;
end
nbits = n,