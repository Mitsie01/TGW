% get planet parameters
planet


% initial conditions
altitude = 400*10*3;
inclination = 0;
x0 = r_earth + altitude;
y0 = 0;
z0 = 0;
semi_major = norm([x0;y0;z0]);
vcircular = sqrt(mu/semi_major);
xdot0 = 0;
ydot0 = vcircular*cos(inclination);
zdot0 = vcircular*sin(inclination);
stateinitial = [x0;y0;z0;xdot0;ydot0;zdot0];



period = 2*pi/sqrt(mu)*semi_major^(3/2);
number_of_orbits = 1;
tspan = [0 period*number_of_orbits];



[tout,stateout] = ode45(@Satellite,tspan,stateinitial);


xout = stateout(:,1);
yout = stateout(:,2);
zout = stateout(:,3);

% make earth
[X,Y,Z] = sphere;
X = X*r_earth;
Y = Y*r_earth;
Z = Z*r_earth;

%plot
fig = figure();
set(fig, 'color', 'white');
plot3(xout,yout,zout,'-b','LineWidth',4);
grid on
hold on
surf(X,Y,Z,'EdgeColor','none')

