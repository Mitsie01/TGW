function dstatedt = Satellite(t,state)
%stateinitial = [x0;y0;z0;xdot0;ydot0;zdot0];

%x = state(1);
%y = state(2);
%z = state(3);
%xdot = state(4);
%ydot = state(5);
%zdot = state(6);

m = 2.6;


vel = state(4:6);

%gravity
planet
r = state(1:3);
rnorm = norm(r);
rhat = r/rnorm;
Fgrav = -(G*mearth*m/rnorm^2)*rhat;


F = Fgrav;

accel = F/m;

dstatedt = [vel, accel];