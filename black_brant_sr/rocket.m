%% Rocket properties

% Black Brant VC sounding rocket

fthrust = 69.4*10^3;            % engine thrust (N)

mrocket = 1261;                 % mass of rocket (kg)
mfuel = 1018;                   % mass of fuel (kg)
mpayload = 100;                 % mass of payload (kg)
burn_time = 32.42;              % burn time of engine/fuel combination (s)

burning_rate = mfuel/burn_time; % fuel burning rate (kg/s)
area = pi*0.42^2;               % surface area of rocket
nozzle_area = pi*0.34^2;        % surface area of engine nozzle

% Calculated using Missile DATCOM 98

M=[0.1 0.5 0.8 1 1.2 1.5 2 2.5 3 3.5 4 ....
    4.5 5 5.5 6 6.5]';                      % Mach number range

Cd=[0.386 0.329 0.325 0.469 0.488 0.434 0.389 0.328 0.287 0.255 0.216 ....
    0.194 0.184 0.169 0.164 0.154 ]';       % Drag coeficcient