%% Initialisation
clear all
clc

global rad 
rad = 2*pi/360;                                             % From degrees to radians

%% Constants

%general constants
dt = 0.01;

%Get Planet Parameters
planet

%Initial Conditions
launch_altitude = 100;                                        % altitude of launching platform (m)
V0 = 7100;


r0 = r_earth+launch_altitude;                                % distance from the center of Earth (m)
theta0 = 0*rad;                                              % starting coordinate
phi0 = 0*rad;                                                % starting coordinate





%% Plot results

[X,Y,Z] = sphere(100);
X = X*r_earth/1000;
Y = Y*r_earth/1000;
Z = Z*r_earth/1000;


%Plot 3D orbit
sim('globe_simulator.slx')

[x,y,z] = sph2cart(theta, phi, r);

fig = figure();
set(fig,'color','white')
plot3(x,y,z,'b-','LineWidth',4)
grid on
hold on
%surf(X,Y,Z,'EdgeColor','none')
%axis equal
xlabel('x') 
ylabel('y')
zlabel('z')

figure('Name','Altitude','NumberTitle','off')
title('Altitude')
hold on
xlabel('Time (s)') 
ylabel('Altitude (m)')
plot(t,r-r_earth)
hold off

figure('Name','Accelleration','NumberTitle','off')
title('Accelleration')
hold on
xlabel('Time (s)') 
ylabel('Acceleration to center (m/s^2)')
plot(t,g)
hold off