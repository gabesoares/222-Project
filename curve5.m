function [ Master_Array, forceArray ] = curve5( Master_Array, forceArray, Incline_Angle, Length )

% Pull in global variables
global I;   % moment of inertia of ball
global m;   % mass of ball
global g;   % acceleration due to gravity
global R;   % Radius of Ball
global t_inc; %increment of t

% Get initial conditions from master array
row = size(Master_Array,1);
StartPx = Master_Array(row, 2);
StartPy = Master_Array(row, 3);
Start_AngVel = Master_Array(row, 8);
Start_t = Master_Array(row, 1);
t = Start_t + t_inc;   %The first time value to be evaluated

%Finding constant Angular Acceleration
alpha = m*(-g)*R*sin(Incline_Angle)/(I+m*R^2);

%Find d after first t_inc
dist_travelled = Start_AngVel*R*t_inc + 0.5*alpha*R*t_inc^2;

while dist_travelled < Length
    %Use energy analysis to determine ang velocity from the initial, under
    %no slip condition
    Cur_AngVel = sqrt(((I+m*R^2)*Start_AngVel^2-2*m*g*dist_travelled*sin(Incline_Angle))/(I+m*R^2));
    CurPx = StartPx + dist_travelled*cos(Incline_Angle);
    CurPy = StartPy - dist_travelled*sin(Incline_Angle);
    Vx = -Cur_AngVel*R*cos(Incline_Angle);
    Vy = -Cur_AngVel*R*sin(Incline_Angle);
    
    %Used force analysis with no friction to find ang acc and then
    %tangential and normal acceleration
    
    ax = -alpha*R*cos(Incline_Angle);
    ay = -alpha*R*sin(Incline_Angle);
    Norm_Force = -m*ax/sin(Incline_Angle);
    
    %Add to master array
    New_Data = [t, CurPx, CurPy, Vx, Vy, ax, ay, Cur_AngVel, alpha];
    newForce = [t, Norm_Force, 0, 0, 0];
    Master_Array = [Master_Array; New_Data];
    forceArray = [forceArray; newForce];
    
    %Update time travelled and distane travelled
    t = t+t_inc;
    dist_travelled = Start_AngVel*R*(t-Start_t) + 0.5*alpha*R*(t-Start_t)^2;
end
%Add to the array the data of the ball after the collision with the end,
%resulting in the ball being at rest.
Last_Data = [t, CurPx, CurPy, 0, 0, 0, 0, 0, 0];
lastForce = [t, m*(-g)*cos(Incline_Angle), 0, 0, 0];
Master_Array = [Master_Array; Last_Data];
forceArray = [forceArray; lastForce];
end

