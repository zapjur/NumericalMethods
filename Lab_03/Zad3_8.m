clear all
close all
clc


N = 2^13;
[hippo,fpr]=audioread('Hippo.wav',[1,N]);
[mosquito,fpr1]=audioread('mosquito.wav',[1,N]);
figure; plot(hippo); title('Hippo(n)');
figure; plot(mosquito); title('Mosquito(n)');

mixed = hippo+mosquito;


n=0:N-1; k=0:N-1;
A = sqrt(2/N)*cos( pi/N *(k'*n));
hippoSpectrum = A*hippo;
% Tego w tym zadaniu nie potrzeba, tylko dla sprawdzenia było 
% mosquitoSpectrum = A*mosquito;                     
% figure; plot(hippoSpectrum); title('Hippo Spectrum');
% figure; plot(mosquitoSpectrum); title("Mosquito Spectrum");

mixedSpectrum = A*mixed;
figure; plot(mixedSpectrum); title("Mixed Spectrum");

mosquitoBackSpectrum = mixedSpectrum - hippoSpectrum;
mosquitoBack = A^-1 * mosquitoBackSpectrum;
figure; plot(mosquitoBack); title("Mosquito Back");

soundsc(mosquito, fpr), pause;
soundsc(hippo, fpr), pause;
soundsc(mixed, fpr), pause;
soundsc(mosquitoBack, fpr);
