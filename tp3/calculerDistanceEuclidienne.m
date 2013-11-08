function [ distance ] = calculerDistanceEuclidienne( histogrammeRef, histogrammeComp )
%CALCULERDISTANCEEUCLIDIENNE Summary of this function goes here
%   Detailed explanation goes here
    n = size(histogrammeRef);
    
    carreDeDiff = 0;
    for i=1:n
        carreDeDiff = carreDeDiff+((histogrammeRef(i)-histogrammeComp(i))^2);
    end
    
    distance = sqrt(carreDeDiff);

end

