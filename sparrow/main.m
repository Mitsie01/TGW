%% Matlab + Simulink simulation of the Sparrow guided missile.
% Mitchell Kampert
% Version 1.0
% 26-10-2022


%% Initial setup

global rad 
rad = 2*pi/360;                 % From degrees to radians

% timestep settings
t0 = 0;
dt = 0.1;
tmax = 1000;

% load data
sparrow
earth

%% run simulation

alpha = 0;

Cn = 2*alpha*()