%% Matlab + Simulink Black Brant sounding rocket simulation
% Mitchell Kampert
% 10-10-2022
% version 1.3


%% Initialisation
clear all

global rad 
rad = 2*pi/360;                 % From degrees to radians


%% Constants

% generic constants
G = 6.67430*10^-11;                 % Gravitational constant
dt = 0.01;                          % simulation time step
tmax = 10000;                       % maximum simulation duration
threshold = 100*10^3;               % threshold altitude

% launch configuration

% starting configuration
x0 = 0;                             % x coordinate
y0 = 0;                             % y coordinate

pitch = 73*rad;                     % pitch

v0 = 0;                             % starting velocity

% rocket properties
black_brant_vc

% Earth properties
earth

centrifugal_force = false;          % enable/disable centrifugal force
rotation = false;                   % enable/disable earth's rotation (at equator heading east)

if rotation == false                % initial horizontal velocity
    veq = 0;
end
v0x = cos(pitch)*v0;
v0y = sin(pitch)*v0;                % initial vertical velocity


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

min_pitch = 76;                             % Minimum pitch for multiplot (deg)
max_pitch = 84;                             % Maximum pitch for multiplot (deg)
pitch_inc = 1;                              % Set pitch increment for multiplot (deg)


% Run simulation
if multiplot == false
    sim('bbsr_sim.slx')
    
    [maxalt, loc] = max(y);
    if x(end) > maxalt
        pltmax = x(end)/1000;
    else
        pltmax = maxalt/1000;
    end

    if pitch > 90*rad
        minx = pltmax;
        maxx = 0;
        miny = 0;
        maxy = -pltmax;
    elseif pitch <= 90*rad
        minx = 0;
        maxx = pltmax;
        miny = 0;
        maxy = pltmax;
    end
    fprintf("Flight distance: %f km.\n", (x(end)/1000));
    fprintf("Apogee: %f km.\n", maxalt/1000);
    fprintf("Time spent above %i km: %f seconds.\n", threshold/1000, tthreshold(end));
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
    
    legend({'Centrifugal force','Gravitational force'},'Location','northeastoutside')
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

    figure('Name','Angle of flight','NumberTitle','off')
    title('Angle of flight')
    plot(t,aof*(180/pi))
    grid on
    xlabel('Time (s)') 
    ylabel('Angle of flight (deg)')

elseif multiplot == true
    dt = 0.1;
    figure('Name','Trajectory','NumberTitle','off')
    title('Trajectory')
    hold on
    for s = min_pitch:pitch_inc:max_pitch
        for mass = min_pl:pl_inc:max_pl
            pitch = s*rad;
            if metric == true
                mpayload = mass;
            elseif metric == false
                mpayload = mass*0.45359237;
            end
            sim('bbsr_sim.slx')
            [maxalt, loc] = max(y);
            scatter((x(end)/1000),maxalt/1000, 25,"o", "filled", "k")
        end
    end
end


