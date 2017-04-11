function [velocity, spin]=club_strike(club, percent)
%CLUB_STRIKE Ball kinematics for a club strike
%      velocity is a three-dimensional vector of initial velocities (mph)
%      spin is a three-dimensional vector of initial spin (rad/s)
%
%      club is a string indicating the chosen club, and can take on
%         the following values:
%          'D' -- driver
%          '2W' to '7W' -- woods from 2 to 7
%          '3I' to '9I' -- irons from 3 to 9
%          'PW' -- pitching wedge
%      percent is the percentage of a full swing.  100 indicates full
%        swing; 50 is a half swing; 150 is a super swing (not realistic,
%        but might be fun to play with).
%
%   Data is based on interpolation of PGA tour averages
%   available from Trackman Golf:
%   http://notnlp.com/wp-content/uploads/2014/03/pga_thumb.png
%

% Find initial velocity, initial angle, and initial spin 
% based on the selected club
switch club
    case 'D'
      v0=167;
      theta0=11;
      omega0 = 2700;
    case '2W'
      v0 = 163;
      theta0 = 10;
      omega0 = 3100;
    case '3W'
      v0=158;
      theta0=9;
      omega0 = 3600;
    case '4W'
      v0=155;
      theta0=9;
      omega0 = 3900;
    case '5W'
      v0=152;
      theta0=9;
      omega0=4300;
    case '6W'
      v0=149;
      theta0=10;
      omega0=4400;
    case '7W'
      v0=146;
      theta0=10;
      omega0=4500;
    case '3I'
      v0=142;
      theta0=10;
      omega0=4600;
    case '4I'
      v0=137;
      theta0=11;
      omega0=4800;
    case '5I'
      v0=132;
      theta0=12;
      omega0=5400;
    case '6I'
      v0=127;
      theta0=14;
      omega0=6200;
    case '7I'
      v0=120;
      theta0=16;
      omega0=7100;
    case '8I'
      v0=115;
      theta0=18;
      omega0=8000;
    case '9I'
      v0=109;
      theta0=20;
      omega0=8600;
    case 'PW'
      v0=102;
      theta0=24;
      omega0=9300;
    otherwise
      v0=0;
      theta0 = 0;
      omega0 = 0;
end

% Convert percent to a fraction
fraction = percent/100;

% Convert the initial angle to rad
theta = theta0 * pi/180

% Calculate the initial velocity vector
v=v0*fraction*.44704;       % convert to m/s from mph
velocity(1) = v*cos(theta); % x component of velocity
velocity(2) = v*sin(theta); % y component of velocity
velocity(3) = 0;            % z component of velocity

% Calculate the initial spin vector
omega = omega0*fraction*.10472; % convert from rpm to rad/s
spin(1)=0;                      % x component of spin
spin(2)=0;                      % y component of spin
spin(3)=omega;                  % z component of spin

end
