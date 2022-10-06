%% Matlab + Simulink rocket simulation
% Mitchell Kampert
% 02-10-2022
% version 1.0


global rad 
rad = 2*pi/360;                 % From degrees to radians


%% Import constants
planet
rocket

%% User inputs
dt = 1;
tmin = 0;
tmax = 10000;

theta = 0;
phi = 0;
pitch = 0*rad;
hdg = 0*rad;

altitude = 500e3;
v0 = 7612.6;

v0t = (cos(pitch)*v0)*sin(hdg);
v0p = (cos(pitch)*v0)*cos(hdg);
v0r = sin(pitch)*v0;


%% Setup
tspan = tmin:dt:tmax;

x0 = [
    theta;
    phi;
    r_body + altitude;
    v0t;
    v0p;
    v0r;

];

C = [
    m_body;
    G;
];

% Solving ODE
options = odeset('RelTol', 1e-10, 'AbsTol', 1e-10*(ones(1,6)));
[t, x] = ode45(@(t,x)oneBody(t,x,C), tspan, x0, options);

%plot
comet3(x(:, 1), x(:, 2), x(:, 3))