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
dt = 0.01;                      % simulation time step
tmax = 1000;                   % maximum simulation duration

% launch configuration

% starting configuration
x0 = 0;                         % x coordinate
y0 = 0;                         % y coordinate

pitch = 60*rad;                 % pitch
railheight = sin(pitch)*25;     % max altitude of rail support

v0 = 0;                         % starting velocity

% rocket properties
black_brant_vc

% Earth properties
earth

centrifugal_force = true;       % enable/disable centrifugal force


% Calculated using Missile DATCOM 98

M=[0.1 0.5 0.8 1 1.2 1.5 2 2.5 3 3.5 4 ....
    4.5 5 5.5 6 6.5]';                      % Mach number range

Cd=[0.386 0.329 0.325 0.469 0.488 0.434 0.389 0.328 0.287 0.255 0.216 ....
    0.194 0.184 0.169 0.164 0.154 ]';       % Drag coeficcient


%% Run Simulink and plot data

sim('bbsr_sim.slx')

figure('Name','Trajectory','NumberTitle','off')
title('Trajectory')
plot(x,y)
grid on
xlabel('Distance (m)') 
ylabel('Altitude (m)')


