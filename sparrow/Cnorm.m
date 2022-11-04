function [CN_sim, CM_sim, alpha_sim] = Cnorm(alpha_0, d_alpha, alpha_max, Ma, delta, Splan, Sw, St, Sref)
%CNORM Summary of this function goes here
%   Detailed explanation goes here

    CN_sim = [];
    CM_sim = [];
    alpha_sim = [];

    sparrow
    
    beta = sqrt((Ma^2)-1);
    
    for alpha = alpha_0: d_alpha: alpha_max
        Cn = (2*alpha)+((1.5*Splan*alpha^2)/Sref)+((8*Sw*alpha)/(beta*Sref))+((8*St*(alpha+delta))/(beta*Sref));
        Cm = ((2*alpha)*((Xcg-Xcpn)/d))+(((1.5*Splan*alpha^2)/Sref)*((Xcg-Xcpb)/d))+(((8*Sw*(alpha+delta))/(beta*Sref))*((Xcg-Xhl)/d))+(((8*St*alpha)/(beta*Sref))*((Xcg-Xcpt)/d));
        CN_sim(end+1) = Cn;
        CM_sim(end+1) = Cm;
        alpha_sim(end+1) = alpha;
    end
end
