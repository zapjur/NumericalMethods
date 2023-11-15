clear all;
close all;
clc;

load('babia_gora.dat'); X=babia_gora;

figure; grid; plot3( X(:,1), X(:,2), X(:,3), 'b.' );

x = X(:,1); y = X(:,2); z = X(:,3);          
xvar = min(x) : (max(x)-min(x))/200 : max(x); 
yvar = min(y) : (max(y)-min(y))/200 : max(y); 

[Xi,Yi] = meshgrid( xvar, yvar );              
out1 = griddata( x, y, z, Xi,Yi, 'cubic' ); 
out2 = griddata( x, y, z, Xi,Yi, 'linear' );
out3 = griddata( x, y, z, Xi,Yi, 'nearest' );
out4 = griddata( x, y, z, Xi,Yi, 'v4' );
figure; 
subplot(221); surf(out1); title("Cubic"); 
subplot(222); surf(out2); title("Linear"); 
subplot(223); surf(out3); title("Nearest"); 
subplot(224); surf(out4); title("Spline"); 
