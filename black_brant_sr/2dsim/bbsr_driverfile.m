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
dt = 0.01;                      % simulation time step
tmax = 10000;                   % maximum simulation duration

% launch configuration

% starting configuration
x0 = 0;                         % x coordinate
y0 = 0;                         % y coordinate

pitch = 76*rad;                  % pitch

v0 = 0;                         % starting velocity

% rocket properties
black_brant_vc

% Earth properties
earth

centrifugal_force = true;       % enable/disable centrifugal force
rotation = false;        % enable/disable earth's rotation (at equator heading east)

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

multiplot = true;

if multiplot == false
    sim('bbsr_sim.slx')
    
    [maxalt, loc] = max(y);
    if pitch > 90*rad
        minx = x(end)/1000;
        maxx = 0;
        miny = 0;
        maxy = -x(end)/1000;
    elseif pitch <= 90*rad
        minx = 0;
        maxx = x(end)/1000;
        miny = 0;
        maxy = x(end)/1000;
    end
    fprintf("Flight distance: %f km.\n", (x(end)/1000));
    fprintf("Apogee: %f km.\n", maxalt/1000);
    fprintf("Flight duration: %f seconds.\n", t(end));
    
    p = burn_time/t(end);
    
    
    figure('Name','Trajectory','NumberTitle','off')
    title('Trajectory')
    hold on
    axis([minx maxx miny maxy])
    comet(x/1000,y/1000, p)
    grid on
    xlabel('Distance (km)') 
    ylabel('Altitude (km)')
    hold off
    
    figure('Name','Velocity','NumberTitle','off')
    title('Velocity')
    plot(t,v)
    grid on
    xlabel('Time (s)') 
    ylabel('Velocity (m/s)')
    
    figure('Name','Acceleration','NumberTitle','off')
    title('Acceleration')
    plot(t,a)
    grid on
    xlabel('Time (s)') 
    ylabel('Acceleration (m/s^s)')
    
    
    figure('Name','Drag force','NumberTitle','off')
    title('Drag force')
    plot(t,fd)
    grid on
    xlabel('Time (s)') 
    ylabel('Drag (N)')
    
    figure('Name','Vertical accelleration','NumberTitle','off')
    title('vertical accelleration')
    hold on
    xlabel('Time (s)') 
    ylabel('Accelleration (m/s^2)')
    plot(t,ac)
    plot(t,g)
    
    legend({'Centrifugal force','Gravitational force'},'Location','southwest')
    hold off
    
    figure('Name','Engine thrust','NumberTitle','off')
    title('Engine thrust')
    plot(t,thrust)
    grid on
    xlabel('Time (s)') 
    ylabel('Thrust (N)')
    
    figure('Name','Mass','NumberTitle','off')
    title('Total rocket mass')
    plot(t,m)
    grid on
    xlabel('Time (s)') 
    ylabel('Mass (kg)')

elseif multiplot == true
    dt = 0.1;
    figure('Name','Trajectory','NumberTitle','off')
    title('Trajectory')
    hold on
    for s = 76:1:84
        fprintf("%d\n", s);
        for mass = 600:100:1300
            fprintf("%d\n", mass);
            pitch = s*rad;
            mpayload = mass*0.45359237;
            sim('bbsr_sim.slx')
            [maxalt, loc] = max(y);
            scatter((x(end)/1000),maxalt/1000, "filled", "black")
        end
    end
end


