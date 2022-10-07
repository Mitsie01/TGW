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

x = 0;
y = 0;
z = 0;
pitch = 0*rad;
hdg = 45*rad;

altitude = 500e3;
v0 = 8612.6;

v0x = (cos(pitch)*v0)*sin(hdg);
v0y = sin(pitch)*v0;
v0z = (cos(pitch)*v0)*cos(hdg);


%% Setup
tspan = tmin:dt:tmax;

x0 = [
    x;
    y + r_body + altitude;
    z;
    v0x;
    v0y;
    v0z;

];

C = [
    m_body;
    G;
    r_body;
];

% Solving ODE
options = odeset('RelTol', 1e-10, 'AbsTol', 1e-10*(ones(1,6)));
[t, x] = ode45(@(t,x)oneBody(t,x,C), tspan, x0, options);

%plot
[Xe,Ye,Ze] = sphere;
axis equal
hold on
r = r_body;
X2 = Xe * r;
Y2 = Ye * r;
Z2 = Ze * r;


surf(X2,Y2,Z2)
plot3(x(:, 1), x(:, 2), x(:, 3), "red",'LineWidth',4)