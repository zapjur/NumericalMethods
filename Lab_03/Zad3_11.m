clear all;
close all;
clc;

babiaGora = load("babia_gora.dat");
figure; grid; plot3(babiaGora(:,1), babiaGora(:,2), babiaGora(:,3), 'magenta'); title("Original");

a = 10; b = 100; c = 1000;
S = [[a, 0, 0]; [0, b, 0]; [0, 0, c]];
babiaGoraScaled = babiaGora * S;
figure; grid; plot3(babiaGoraScaled(:,1), babiaGoraScaled(:,2), babiaGoraScaled(:,3), 'magenta'); title("Scaled");

x = 1000; y = 10; z = 10000;
T = zeros(1,3);
T(:, 1) = x;
T(:, 2) = y;
T(:, 3) = z;
babiaGoraTranslated = babiaGora + T;
figure; grid; plot3(babiaGoraTranslated(:,1), babiaGoraTranslated(:,2), babiaGoraTranslated(:,3), 'magenta'); title("Translated");

M = [[-1, 0, 0]; [0, 1, 0]; [0, 0, 1]];
babiaGoraMirrored = babiaGora * M;
figure; grid; plot3(babiaGoraMirrored(:,1), babiaGoraMirrored(:,2), babiaGoraMirrored(:,3), 'magenta'); title("Mirrored");

R = [[cos(45), -sin(45), 0]; [sin(45) cos(45) 0]; [0 0 1]];
babiaGoraRotated = babiaGora * R;
figure; grid; plot3(babiaGoraRotated(:,1), babiaGoraRotated(:,2), babiaGoraRotated(:,3), 'magenta'); title("Rotated");

Sh = [[1 0 0]; [0.5 1 0]; [0 0 1]];
babiaGoraSheared = babiaGora * Sh;
figure; grid; plot3(babiaGoraSheared(:,1), babiaGoraSheared(:,2), babiaGoraSheared(:,3), 'magenta'); title("Sheared");