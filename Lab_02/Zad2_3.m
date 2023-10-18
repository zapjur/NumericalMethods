clear all
close all 
clc

a=fi( 11.25,0,8,4), a.bin,
b=fi( 4.75,0,8,4), b.bin,
c=fi( 4.75,1,8,4), c.bin,
d=fi(-4.75,1,8,4), d.bin,

p=fi(pi,0,8,6), p.bin,
ps=fi(pi,1,8,6), ps.bin,
p1=fi(pi,0,16,12), p1.bin,
p1s=fi(pi,1,16,12), p1s.bin,

ratio = p.double/pi,
ratios = ps.double/pi,
ratio1 = p1.double/pi,
ratio1s = p1s.double/pi,