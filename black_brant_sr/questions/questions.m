%% Matlab + Simulink Black Brant sounding rocket simulation
% Mitchell Kampert
% 02-10-2022
% version 1.43


%% Initialisation
clear all

global rad 
rad = 2*pi/360;                 % From degrees to radians


%% Constants

% generic constants
G = 6.67430*10^-11;             % Gravitational constant
dt = 0.1;                      % simulation time step
tmax = 10000;                   % maximum simulation duration

% launch configuration

% starting configuration
x0 = 0;                         % x coordinate
y0 = 0;                         % y coordinate

pitch = 81*rad;                  % pitch

v0 = 0;                         % starting velocity

% rocket properties
black_brant_vc

% Earth properties
earth

centrifugal_force = false;       % enable/disable centrifugal force
rotation = false;                % enable/disable earth's rotation (at equator heading east)

if rotation == false             % initial horizontal velocity
    veq = 0;
end
v0x = sin(pitch)*v0;
v0y = sin(pitch)*v0;            % initial vertical velocity


% Calculated using Missile DATCOM 98

M=[0.1 0.5 0.8 1 1.2 1.5 2 2.5 3 3.5 4 ....
    4.5 5 5.5 6 6.5]';                      % Mach number range

Cd=[0.386 0.329 0.325 0.469 0.488 0.434 0.389 0.328 0.287 0.255 0.216 ....
    0.194 0.184 0.169 0.164 0.154 ]';       % Drag coeficcient


%% Run Simulink and plot data

% Set simulation type
multiplot = false;                          % Create scatter plot of the apogee/distance of the BBSR at multiple angles/payloads

% Multiplot settings
metric = false;                             % Set unit of mass for multiplot

min_pl = 600;                               % Minimum payload for multiplot
max_pl = 1300;                              % Maximum payload for multiplot
pl_inc = 100;                               % Set payload increment for multiplot

min_pitch = 72;                             % Minimum pitch for multiplot (deg)
max_pitch = 74;                             % Maximum pitch for multiplot (deg)
pitch_inc = 0.5;                              % Set pitch increment for multiplot (deg)


sim('qsim.slx')

figure('Name','Trajectory','NumberTitle','off')
title('Trajectory')
hold on
for s = min_pitch:pitch_inc:max_pitch
        pitch = s*rad;
        sim('qsim.slx')
        plot(x, y)
end

