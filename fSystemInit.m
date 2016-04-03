function [  ] = fSystemInit(  )
% This function initializes the global variables required for the
% simulation. Change ball parameters here. 

global g;   % Gravity
global R;   % Radius of Ball
global m;   % Mass of Ball
global I;   % Moment of inertia of ball
global steps;
global k;   % Spring constant of the ball
global impact_time; % Impact time between the spring and the ball
global s; % Distance compressed by the spring
global t_inc; % Time increment

global trackData;
global forceData;

g = -9.81; % In metres/s^2
R = 0.01; % In metres
m = 0.016; % In kilograms
I = 0.4 * m * R^2; % In kilograms * m^2
%steps = 10;
k = 100; % In Newtons/metre
impact_time = 0.00141; % In seconds
s = 0.05; % In metres
t_inc = 0.01; % In seconds - to see the rolling at the start, you need 0.01 resolution. for testing speed, 0.05 is better

trackData = zeros(1,9);
forceData = zeros(1, 4);
end

