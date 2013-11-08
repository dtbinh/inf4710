function listedist = rechercher(nomImage,nomRepertoire)
% Rechercher les images similaires à l'image requête
% function listedist = rechercher(nomImage,nomRepertoire)
%****************************************************************            
% Auteur: votre nom          
% Paramètres: 
% nomImage: Chemin absolu de l'image requête
% nomRepertoire: Chemin absolu du répertoire contenant la base 
% de données d'images indexées
% listedist: tableau de structures trié. Une structure comprend
% 2 champs: le nom de l'image et la distance calculée.
%****************************************************************
% À compléter

refImg = imread(nomImage);
refHisto = genererHistogrammePondere(refImg, 4);
listedist = [];

files = dir(nomRepertoire);
    for f = files'
        if(isImage(f.name))
            path = buildPath(f.name, nomRepertoire);
            h = genererHistogrammePondere(imread(path), 4);
            d = calculerDistanceEuclidienne(refHisto, h);
            listedist = insertInList(listedist, makeStruct(f.name,d));
        end
    end
end


function isImage = isImage(filename)
    if(length(filename)<4)
        isImage=false;
        return;
    end
    
    imagesExt = ['jpg', 'png', 'bmp', 'gif'];
    ext = filename(end-3+1:end);
    isImage = ismember(ext, imagesExt);
end

function path = buildPath(filename, dir)
    path = strcat(dir,'\',filename);
end

function list = insertInList(list, item)
    
    for i=1:length(list)
        if list(i).distance>=item.distance
            list = [list(1:i-1) item list(i:end)];
            return;
        end
    end
    
    list = [list item];
end

function s = makeStruct(filename, distance)
    s = struct('nom', filename, 'distance', distance);
end
