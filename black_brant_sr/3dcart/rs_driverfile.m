%% Matlab + Simulink Black Brant sounding rocket simulation
% Mitchell Kampert
% 05-09-2022
% version 1.1


%% Initialisation
clear all
clc

global rad 
rad = 2*pi/360;                 % From degrees to radians


%% Constants

% generic constants
G = 6.67430*10^-11;             % Gravitational constant
dt = 0.01;                     % simulation time step

% launch configuration

% starting configuration
x0 = 0;                         % x coordinate
y0 = 0;                         % y coordinate
z0 = 0;                         % z coordinate

hdg = 0*rad;                    % heading
pitch = 30*rad;                 % pitch

v0 = 0;                         % starting velocity

% rocket properties
fthrust = 69.4*10^3;            % engine thrust (N)
mrocket = 1361;                 % mass of rocket (kg)
mfuel = 1018;                   % mass of fuel (kg)
burning_rate = 1018/32.42;      % fuel burning rate (kg/s)
area = pi*0.42^2;               % surface area of rocket
nozzle_area = pi*0.34^2;        % surface area of engine nozzle


% environment properties
mearth = 5.9722*10^24;          % mass Earth (kg)
r_earth = 6.3781*10^6;          % radius Earth (m)
w = (1/43200)*pi;                  % angular velocity Earth (rad/s)

D0 = 1.225;                     % density at sealevel (kg/m^3)
P0 = 1.01325*10^5;              % pressure at sealevel (Pa)
H = 7640;                       % scale height

centrifugal_force = true;       % enable/disable centrifugal force
rotation = false;                % enable/disable Earth rotation
latitude = 0*rad;               % angle from equator



% Calculated using Missile DATCOM 98

M=[0.1 0.5 0.8 1 1.2 1.5 2 2.5 3 3.5 4 ....
    4.5 5 5.5 6 6.5]';                      % Mach number range

Cd=[0.386 0.329 0.325 0.469 0.488 0.434 0.389 0.328 0.287 0.255 0.216 ....
    0.194 0.184 0.169 0.164 0.154 ]';       % Drag coeficcient


% Wind parameters

wind_effect = false;

vmin = 10;
vmax = 15;
direction = 40*rad;
var = 5*rad;


%% Run Simulink and plot data

sim('trajectory_sim.slx')

figure('Name','Trajectory','NumberTitle','off')
title('Trajectory')
plot3(x,y,z)
grid on
xlabel('Longitudinal distance (m)') 
ylabel('Lateral distance (m)')
zlabel('Altitude (m)')

figure('Name','Total velocity','NumberTitle','off')
title('Total velocity')
hold on
xlabel('Time (s)') 
ylabel('Velocity (m/s)')
plot(t,v)
hold off

figure('Name','Thrust','NumberTitle','off')
title('Thrust')
hold on
xlabel('Time (s)') 
ylabel('Thrust (N)')
plot(t,thrust)
hold off

figure('Name','Mass','NumberTitle','off')
title('Total rocket mass')
hold on
xlabel('Time (s)') 
ylabel('Mass (kg)')
plot(t,mass)
hold off

figure('Name','Air density','NumberTitle','off')
title('Air density')
hold on
xlabel('Time (s)') 
ylabel('Density (kg/m3)')
plot(t,density)
hold off

figure('Name','Vertical accelleration','NumberTitle','off')
title('vertical accelleration')
hold on
xlabel('Time (s)') 
ylabel('Accelleration (m/s^2)')

plot(t,fc)
plot(t,fg)

legend({'Centrifugal force','Gravitational force'},'Location','southwest')
hold off

figure('Name','Drag force','NumberTitle','off')
title('Drag force (x, y, z components)')
hold on

plot(t, fdx)
plot(t, fdy)
plot(t, fdz)

legend({'X','Y','Z'},'Location','southwest')
xlabel('Time (s)') 
ylabel('Force (N)')
hold off


