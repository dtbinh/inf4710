function [ distance ] = calculerDistanceEuclidienne( histogrammeRef, histogrammeComp )
    n = size(histogrammeRef);
    
    carreDeDiff = 0;
    for i=1:n
        carreDeDiff = carreDeDiff+((histogrammeRef(i)-histogrammeComp(i))^2);
    end
    
    distance = sqrt(carreDeDiff);

end

