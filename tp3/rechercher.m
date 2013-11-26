function listedist = rechercher(nomImage,nomRepertoire)
% Rechercher les images similaires � l'image requ�te
% function listedist = rechercher(nomImage,nomRepertoire)
%****************************************************************            
% Auteur: votre nom          
% Param�tres: 
% nomImage: Chemin absolu de l'image requ�te
% nomRepertoire: Chemin absolu du r�pertoire contenant la base 
% de donn�es d'images index�es
% listedist: tableau de structures tri�. Une structure comprend
% 2 champs: le nom de l'image et la distance calcul�e.
%****************************************************************

fprintf('Recherche... \n');
        
refImg = imread(nomImage);
refHisto = genererHistogrammePondere(refImg, 4);
listedist = [];
repIndex = strcat(nomRepertoire, '\index');
        fprintf('%s\n', repIndex);
files = dir(repIndex);
    for f = files'
        if(isText(f.name))
            fprintf('%s\n', f.name);
            path = buildPath(f.name, repIndex);
            h = dlmread(path);
            d = calculerDistanceEuclidienne(refHisto, h);
            listedist = insertInList(listedist, makeStruct(f.name(1:end-4),d));
        end
    end
fprintf('Recherche completee. \n');
end

function isTxt = isText(filename)
    if(length(filename)<4)
        isTxt = 0;
        return;
    end
    
    isTxt = filename(end-2:end) == 'txt';
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
