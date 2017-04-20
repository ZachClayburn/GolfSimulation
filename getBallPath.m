function [t,R] = getBallPath(R0)%figure out params
tSpan = 0:.1:10;
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
diameter = 0.0427;
area = pi()*(diameter/2)^2;
density = 1.225;
CDrag = 0.3;
g = 9.8;
dragNum = CDrag / (2*mass) * density * area;
mangusNum = diameter * density * area / (4*mass);
RPrime = zeros(12,1);

x = 1;
y = 2;
z = 3;
vRelx = 4;
vRely = 5;
vRelz = 6;
windx = 7;
windy = 8;
windz = 9;
omegax = 10;
omegay = 11;
omegaz = 12;

RPrime(x) = R(vRelx) + R(windx);
RPrime(y) = R(vRely) + R(windy);
RPrime(z) = R(vRelz) + R(windz);
RPrime(vRelx) = -dragNum*R(vRelx)*abs(R(vRelx)) + mangusNum*(R(omegay)*R(vRelz) - R(omegaz)*R(vRely));
RPrime(vRely) = -g - dragNum*R(vRely)*abs(R(vRely)) ;%+ mangusNum*(R(omegaz)*R(vRelx) - R(omegax)*R(vRelz));
RPrime(vRelz) = -dragNum*R(vRelz)*abs(R(vRelz)) + mangusNum*(R(omegax)*R(vRely) - R(omegay)*R(vRelx));
RPrime(windx) = 0;
RPrime(windy) = 0;
RPrime(windz) = 0;
RPrime(omegax) = 0;
RPrime(omegay) = 0;
RPrime(omegaz) = 0;