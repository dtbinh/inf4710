function indexer(nomRepertoire)
% Indexer une base de données d'images
% function indexer(nomRepertoire)
%****************************************************************            
% Auteur: Gabriel Couvrette        
% Paramètre: 
% nomRepertoire: Chemin absolu du répertoire contenant la base 
% de données d'images 
%****************************************************************

mkdir(nomRepertoire, 'index');

files = dir(nomRepertoire);
    for f = files'
        if(isImage(f.name))
            path = buildPath(f.name, nomRepertoire);
            h = genererHistogrammePondere(imread(path), 4);
            dlmwrite(strcat(nomRepertoire,'/index/',f.name,'.txt'), h);
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
