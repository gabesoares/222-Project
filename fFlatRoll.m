function [ flatRollKin, flatRollForce ] = fFlatRoll(distance)
%FFLATROLL Summary of this function goes here
%   Detailed explanation goes here

global g;   % Gravity
global R;   % Radius of Ball
global m;   % Mass of Ball
global t_inc; % Time increment

global trackData;
global forceData;

matrixHeight = size(trackData,1);

vi = trackData(matrixHeight, 4);
wi = trackData(matrixHeight, 8);
xi = trackData(matrixHeight, 2);
yi = trackData(matrixHeight, 3);
t0 = trackData(matrixHeight, 1);

flatRollKin = zeros(1, 8);
flatRollForce = zeros(1,3);

t = 0;
i = 0;
travelled = vi * t + xi;

while(travelled < distance)
    flatRollKin(i+1, 2) = travelled;
    flatRollKin(i+1, 1) = t + t0;
    flatRollKin(i+1, 8) = wi;
    flatRollKin(i+1, 4) = yi;
    
    flatRollForce(i+1, 1) = t + t0;
    flatRollForce(i+1, 2) = m * g;
    
    i = i+1;
    t = t + t_inc;    
end

end

