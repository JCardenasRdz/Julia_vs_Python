function [ rsq ] = r_squared( Yobserved, Ypredicted)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Yobserved= Yobserved(:);
Ypredicted = Ypredicted(:);

    ssres = sum((Yobserved - Ypredicted).^2);
    tss = sum((Yobserved - mean(Ypredicted)).^2);
    rsq = 1 - (ssres/tss);
 
end

