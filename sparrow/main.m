%% Matlab + Simulink simulation of the Sparrow guided missile.
% Mitchell Kampert
% Version 1.0
% 26-10-2022


%% Initial setup

global rad 
rad = 2*pi/360;                 % From degrees to radians

% sim settings
t0 = 0;
dt = 0.1;
tmax = 1000;
alpha_0 = 0;
alpha_max = 19;
d_alpha = 1;
Ma = 2;
delta = 0;

% load data
sparrow
earth
datcom_data

%% run simulation

[CN_sim, CM_sim, alpha_sim] = Cnorm(alpha_0, d_alpha, alpha_max, Ma, delta, Splan, Sw, St, Sref);

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
plot(alpha_sim, CM_sim/1000)
grid on
xlabel('alpha') 
ylabel('Cm')
hold off