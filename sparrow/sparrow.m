%% Sparrow data

m = 120;


L = 3.657;
Ln = 0.193;
d = 0.203;

Xw = 1.102;

Xcg = 1.925;

Crw = 0.495;
Ctw = 0.097;
Hw = 0.398;

Crt = 0.473;
Ctt = 0;
Ht = 0.308;

An = 0.67*Ln*d;
Ab = (L-Ln)*d;

%% Centers of pressure

Xcpn = 0.67*Ln;
Xcpb = ((0.67*An*Ln)+Ab*(Ln+0.5*(L-Ln)))/(An+Ab);
Xhl = 1.829;
Xcpt = L-0.3*Crt-0.2*Ctt;

%% S values

Sref = (pi*d^2)/4;
Sw = 0.5*Hw*(Ctw+Crw);
St = 0.5*Ht*(Ctt+Crt);
Splan = ((L-Ln)*d)+(0.67*Ln*d);