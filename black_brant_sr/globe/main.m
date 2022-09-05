%% Initialisation
clear all
clc

global rad 
rad = 2*pi/360;                                     % From degrees to radians

%% Constants
%Get Planet Parameters
planet

%Initial Conditions
altitude = 1400*10^3;                               % altitude (m)
x0 = r_earth + altitude;                            % distance from the center of Earth (m)
y0 = 0;                                             % starting coordinate
z0 = 0;                                             % starting coordinate
xdot0 = 0;
inclination = 10*rad;                               % angle over equator (rad)
semi_major = norm([x0;y0;z0]);
vcircular = 8000;                                   % orbital velocity (m/s)
ydot0 = vcircular*cos(inclination);                 % velocity in y direction (m/s)
zdot0 = -vcircular*sin(inclination);                % velocity in z direction (m/s)
stateinitial = [x0;y0;z0;xdot0;ydot0;zdot0];

% simulation time
period = 2*pi/sqrt(mu)*semi_major^(3/2);            % time period of spherical orbit (s)
number_of_orbits = 1;                               % simulate n amount of orbits

%% Calculations
tspan = [0 period*number_of_orbits];                % calculate total simulation time

%This is where we integrate the equations of motion
[tout,stateout] = ode45(@Satellite,tspan,stateinitial);     % Calculate forces

stateout = stateout/1000;                           % convert to km

%Extract the state vector
xout = stateout(:,1);
yout = stateout(:,2);
zout = stateout(:,3);

%Make an Earth
[X,Y,Z] = sphere(100);
X = X*r_earth/1000;
Y = Y*r_earth/1000;
Z = Z*r_earth/1000;


%% Plot results
%Plot 3D orbit
fig = figure();
set(fig,'color','white')
plot3(xout,yout,zout,'b-','LineWidth',4)
grid on
hold on
surf(X,Y,Z,'EdgeColor','none')
axis equal
xlabel('x') 
ylabel('y')
zlabel('z')