%% Matlab + Simulink simulation of the Sparrow guided missile.
% Mitchell Kampert
% Version 1.0
% 26-10-2022


%% Initial setup

global rad 
rad = 2*pi/360;                 % From degrees to radians

% sim settings
alpha_0 = 0*rad;
alpha_max = 20*rad;
d_alpha = 1*rad;
Ma = 2;
delta = 0*rad;

% load data
sparrow
earth
datcom_data

%% run simulation

[CN_sim, CM_sim, alpha_sim] = Cn_m(alpha_0, d_alpha, alpha_max, Ma, delta, Splan, Sw, St, Sref);

%% plot graphs

figure('Name','Cn','NumberTitle','off')
title('Cn')
hold on
plot(alpha_datcom, CN_datcom)
plot(alpha_sim, CN_sim)
grid on
xlabel('alpha') 
ylabel('Cn')
hold off

figure('Name','Cm','NumberTitle','off')
title('Cm')
hold on
plot(alpha_datcom, CM_datcom)
plot(alpha_sim, CM_sim)
grid on
xlabel('alpha') 
ylabel('Cm')
hold off

%% Simulink model
% sim settings
t0 = 0;
dt = 0.01;
tmax = 10;

alpha0 = 0;

delta_min = 0*rad;
delta_max = 5*rad;

Vm = 700;
altitude = 0;

sim('sparrow_sim.mdl')


figure('Name','Normal force','NumberTitle','off')
title('Normal force')
plot(t,nb)
grid on
xlabel('Time (s)') 
ylabel('Force (N)')

