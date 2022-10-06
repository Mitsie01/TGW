fthrust = 69.4*10^3;            % engine thrust (N)

mrocket = 1261;                 % mass of rocket (kg)
mfuel = 1018;                   % mass of fuel (kg)
mpayload = 362.8;                 % mass of payload (kg)
burn_time = 32.42;              % burn time of engine/fuel combination (s)

burning_rate = mfuel/burn_time; % fuel burning rate (kg/s)
area = pi*0.42^2;               % surface area of rocket
nozzle_area = pi*0.34^2;        % surface area of engine nozzle