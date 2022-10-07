function [dx] = oneBody(t, x, C)

%{
x(1) = x
x(2) = y
x(3) = z
x(4) = x'
x(5) = y'
x(6) = z'

C(1) = m_body
C(2) = G
C(3) = r_body
%}

r_mag = sqrt(x(1)^2+x(2)^2+x(3)^2);                           % magnitude pos vector
if r_mag <= C(3)
    dx = [
        0;
        0;
        0;
        0;
        0;
        0;
    ];
else
    r_x = x(1)/r_mag;
    r_y = x(2)/r_mag;
    r_z = x(3)/r_mag;
    F = -C(1)*C(2)/(r_mag^2);
    
    dx = [
        x(4);
        x(5);
        x(6);
        F*r_x;
        F*r_y;
        F*r_z;
    ];
end


end