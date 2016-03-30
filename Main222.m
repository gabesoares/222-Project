% Once functions for individual features are implemented, run them here. 
% Bottom left of board is 0,0. 

clear all;
fSystemInit; % this sets up globals

% Master matrix of all the data needed
data = zeros(1,9); % time, pos_x, pos_y, v_x, v_y, omega, a_gx, a_gy, alpha

[F_spring, data] = initSpring(data); % Will update the data matrix with the initial velocity and angular velocity after it is launched from the spring
% F_spring is the impact force of the spring on the ball, found using conservation of linear momentum

% demo: get the data for a quarter-circle 7cm loop at 7cm, 7cm. 
% Output MATRIX Columns: theta, xpos, ypos, ax, ay, time, w
% please note that the time and w are not correct, and ax and ay are also
% just based on angle/gravity (I'll fix it though)
Curve1 = fLoopXYPos(0.07,0.07,0,0,pi,1.5*pi,0.07);

% Normally you'd pass the appropriate parameters to the next function, like
% velocities and accelerations. 

% demo: get the data for a quarter-circle 5cm loop at 2cm, 7cm. 
Curve2 = fLoopXYPos(0.02,0.07,0,0,pi,1.5*pi,0.05);

Curve3 = [Curve1; Curve2];   % vertically concatente the matrices
