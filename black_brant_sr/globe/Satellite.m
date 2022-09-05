function dstatedt = Satellite(t,state)
%stateinitial = [x0;y0;z0;xdot0;ydot0;zdot0];

%x = state(1);
%y = state(2);
%z = state(3);
%xdot = state(4);
%ydot = state(5);
%zdot = state(6);

%inertia and mass
m_empty = 1261; %kilograms
%m_payload = 100;
%m_fuel = 1018;

%Kinematics
vel = state(4:6);

%Gravity Model
planet
r = state(1:3); % r = [x;y;z]
rnorm = norm(r);
rhat = r/rnorm;
Fgrav = -(G*m_earth*m_empty/rnorm^2)*rhat;

%Dynamics
F = Fgrav;
accel = F/m_empty;

%Return derivatives vector
dstatedt = [vel;accel];

