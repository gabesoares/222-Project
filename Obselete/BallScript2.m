thetaMin = pi;
thetaMax = 1.5*pi;
range = thetaMax - thetaMin;
m = 0.02
g = -9.81

steps = 10;

T = zeros(1:steps)

prevTheta = theta;
prevAt = 0;

trackRadius = 0.1;
ballRadius = 0.05;

vi = 0;

for i = 1:steps
    theta = thetaMin + ((range/steps)*i);
    
    k = cot(theta); % k is the slope of the curve, or at vector
    
    q = abs(k);  % this is the angle between the mg vector and the at vector 
   
   at(i) = m*g*cos(q);  % Set the at and an (instantaneous)
   an(i) = m*g*sin(q);
   a(i) = sqrt(at^2 +an^2);
   
   % Let's figure out the change in distance (arc length)
   d(i) = (theta - prevTheta) * (trackRadius - ballRadius);
   prevTheta = theta;   % Update the last theta value for the next calculation

   % Let's find out the time 
   deltaAt(i) = at(i) - prevAt;
   syms t;
   t = vpasolve(d(i) == (vi*t - 0.8*deltaAt(i)*t^2), t);
   T(i) = t(t>0);   % Puts the positive time into T vector
   
   vi = at * T;
   
end

disp(sum(T));
