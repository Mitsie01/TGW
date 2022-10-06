function [dx] = oneBody(t, x, C)

%{
x(1) = theta
x(2) = phi
x(3) = r
x(4) = wtheta
x(5) = wphi
x(6) = r'

C(1) = m_earth
C(2) = G
%}

r_mag = x(3);                           % magnitude pos vector
r_x = x(1)/r_mag;
r_y = x(2)/r_mag;
r_z = x(3)/r_mag;
F = -C(2)*C(1)/(r_mag^2);

dx = [
    x(4);
    x(5);
    x(6);
    F*r_x;
    F*r_y;
    F*r_z;
];


end