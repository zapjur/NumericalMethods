clear all; 
close all;
clc;

img = imread('Lena256.bmp');
figure; imshow(img); pause
[M,N]=size(img);
[X,Y]=meshgrid(1:M,1:N);
[Xi,Yi]=meshgrid( M/2-20 : 0.025 : M/2+20, N/2-20 : 0.025 : N/2+20 );
img1 = uint8( interp2( X,Y,double(img),Xi,Yi,'nearest') );
img2 = uint8( interp2( X,Y,double(img),Xi,Yi,'linear') );
img3 = uint8( interp2( X,Y,double(img),Xi,Yi,'spline') );
img4 = uint8( interp2( X,Y,double(img),Xi,Yi,'cubic') );

figure;
subplot(221); imshow( img1 ); title('Nearest');
subplot(222); imshow( img2 ); title('Linear');
subplot(223); imshow( img3 ); title('Spline');
subplot(224); imshow( img4 ); title('Cubic'); pause

a = pi/6;                                % kat rotacji
R = [ cos(a) -sin(a); sin(a) cos(a) ];   % macierz rotacji
for m=1:M
    for n=1:N
        work = R*[X(m,n); Y(m,n)];       % rotacja wsp. (x,y)
        XR(m,n) = work(1,1);             % podstawienie nowego x
        YR(m,n) = work(2,1);             % podstawienie nowego y
    end
end    
imgR1 = interp2( X,Y,double(img),XR,YR,'nearest');
imgR2 = interp2( X,Y,double(img),XR,YR,'linear');
imgR3 = interp2( X,Y,double(img),XR,YR,'spline');
imgR4 = interp2( X,Y,double(img),XR,YR,'cubic'); % interpolacja obroconego 
[Xi,Yi]=meshgrid( 1 : 0.2 : M, 1 : 0.2 : N );      % zageszczenie punktow
imgRi1 = interp2( X,Y,imgR1,Xi,Yi,'nearest');     
imgRi2 = interp2( X,Y,imgR2,Xi,Yi,'linear');  
imgRi3 = interp2( X,Y,imgR3,Xi,Yi,'spline');  
imgRi4 = interp2( X,Y,imgR4,Xi,Yi,'cubic');  % interpolacja - poprawa jakosci
figure; 
subplot(221); imshow( uint8(imgRi1) ); title('Nearest');
subplot(222); imshow( uint8(imgRi2) ); title('Linear')
subplot(223); imshow( uint8(imgRi3) ); title('Spline')
subplot(224); imshow( uint8(imgRi4) ); title('Cubic')% wynik

