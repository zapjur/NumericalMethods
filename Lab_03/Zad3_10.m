close all;
clear all;
clc;

babiaGora = load('babia_gora.dat');

syms yaw pitch roll;

Rz = [[cos(yaw) -sin(yaw) 0]; [sin(yaw) cos(yaw) 0]; [0 0 1]];
Ry = [[cos(pitch) 0 sin(pitch)]; [0 1 0];[-sin(pitch) 0 cos(pitch)]];
Rx = [[1 0 0]; [0 cos(roll) -sin(roll)]; [0 sin(roll) cos(roll)]];

A = Rz * Ry * Rx;


for d=0:180

    myPlot(babiaGora * rotationMatrix(A, d,0,0, yaw, pitch, roll)); pause(0.1);

end


function rotatedMatrix = rotationMatrix(A, givenYaw, givenPitch, givenRoll, yaw, pitch, roll)
    Aval = subs(A,[yaw, pitch, roll], [deg2rad(givenYaw), deg2rad(givenPitch), deg2rad(givenRoll)]);
    rotatedMatrix = Aval;
end

function myPlot(P)
   plot3(P(:, 1), P(:, 2), P(:, 3), 'magenta');
end


