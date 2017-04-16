function [t,R] = getBallPath(R0,tSpan)%figure out params

options = odeset('Events',@events);

[t,R] = ode45(@(t,R) odefun(t,R),tSpan,R0,options);

function [value,isterminal,direction] = events(t,R)
% Locate the time when height passes through zero in a decreasing direction
% and stop integration.
value = R(2); % detect y = 0;
isterminal = 1; % stop the integration
direction = -1; % negative direction

function RPrime = odefun(~,R)

mass = 0.0459;
diameter = 0.427;
area = pi()*(diameter/2)^2;
density = 1.225;
CDrag = 0.3;
g = 9.8;
dragNum = CDrag / (2*mass) * density * area;
mangusNum = diameter * density * area / (4*mass);
RPrime = zeros(12,1);

RPrime(1) = R(4) + R(7);
RPrime(2) = R(5) + R(8);
RPrime(3) = R(6) + R(9);
RPrime(4) = -dragNum*R(4)^2 + mangusNum*(R(11)*R(12) - R(12)*R(11));
RPrime(5) = -g - dragNum*R(5)^2 + mangusNum*(R(12)*R(10) - R(10)*R(12));
RPrime(6) = -dragNum*R(6)^2 + mangusNum*(R(10)*R(11) - R(11)*R(10));
RPrime(7) = 0;
RPrime(8) = 0;
RPrime(9) = 0;
RPrime(10) = 0;
RPrime(11) = 0;
RPrime(12) = 0;