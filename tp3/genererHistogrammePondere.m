function [ histogramme ] = genererHistogrammePondere( imageData, colorspace )
    % Fonction qui cree un histogramme du ImageData, considerant 'colorspace'
    % differentes valeurs par canal pour les valeurs. Ex: 255 => toutes les
    % couleurs, 4 => 64 couleurs differentes (4^3).

    histogramme = zeros(1, colorspace^3);
    
    %on change le colorspace de l'image
    imgC = floor((double(imageData)/256.0)*colorspace);

    [height, width, channels] = size(imgC);
    
    for y=1:height
        for x=1:width
            index = rgbToIndex(imgC(y,x,1),imgC(y,x,2),imgC(y,x,3), colorspace);
            histogramme(index) = histogramme(index)+pixelsSemblablesDuVoisinage(imgC, y, x); %% TODO: Inserer ponderation ici au lieu de 1 !!!
        end
    end
    
    %normalisation pour pas que lhistogramme depende du nombre de pixels.
    histogramme = histogramme./(height*width);
        

end

% helper functions
function [i] = rgbToIndex(r,g,b,colorspace)
    i = 1+(b + colorspace*g + (colorspace^2)*r);
end

%nb de pixels du voisinage ayant la meme valeur que la couleur dans coord.
function [w] = pixelsSemblablesDuVoisinage(imgc, y, x)

    [height, width, channels] = size(imgc);
    %au moins soi-meme
    w = 1;
    
    %top
    if(y>1)
        if(imgc(y-1,x) == imgc(y,x))
            w=w+1;
        end
    end
    
    %bottom
    if(y<height)
        if(imgc(y+1,x) == imgc(y,x))
            w=w+1;
        end
    end
    
    %left
    if(x>1)
        if(imgc(y,x-1) == imgc(y,x))
            w=w+1;
        end
    end
    
    %right
    if(x<width)
        if(imgc(y,x+1) == imgc(y,x))
            w=w+1;
        end
    end
        
end