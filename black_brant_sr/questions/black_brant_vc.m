%import Earth data
earth

fthrust = 69.4*10^3;            % engine thrust (N)

mrocket = 243;                 % mass of rocket (kg)
mfuel = 1018;                   % mass of fuel (kg)
mpayload = 100;                 % mass of payload (kg)
burn_time = 32.42;              % burn time of engine/fuel combination (s)

burning_rate = mfuel/burn_time; % fuel burning rate (kg/s)
area = pi*0.42^2;               % surface area of rocket
nozzle_area = pi*0.34^2;        % surface area of engine nozzle
Isp = fthrust/(G0*burning_rate);% specific impulse (s)
Ve = Isp * G0;                  % Exhaust exit speed (m/s)
