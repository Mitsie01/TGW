%% Planet properties

% Earth

G = 6.67430*10^-11;                     % Gravitational constant

m_body = 5.9722*10^24;          % mass Earth (kg)
r_body = 6.3781*10^6;          % radius Earth (m)
w = (1/43200)*pi;               % angular velocity Earth (rad/s)
veq = w*r_body;                % velocity at equator (m/s)

D0 = 1.225;                     % density at sealevel (kg/m^3)
P0 = 1.01325*10^5;              % pressure at sealevel (Pa)
H = 7640;                       % scale height