function code=lz77 (signal, tailleFG, tailleDict)
    % signal : le signal à coder (entrée de l’algorithme).
    % tailleFG : la taille de la fenêtre glissante.
    % tailleDict : la taille du dictionnaire.
    % code : un vecteur de type uint8 (résultat du codage LZ77).
    
    % on init le dictionnaire avec des uint8(0) et on prend
    % les 
    dict = uint8(zeros(1, tailleDict));
    fenetreDroite = signal(1:tailleFG-tailleDict);
    signal = signal(length(fenetreDroite)+1:end);
        
    code = [];
    
    continuer = 1;
    while(continuer == 1)
        %on place la fenetre
        fenetre = [dict fenetreDroite];

        %pour chaque valeur du dictionnaire, on trouve la concurrence max:
        possibilites = [];
        for i_d = 1:tailleDict
            longueur = 0;
            difference = 0;
            for j_d = i_d:length(fenetre)
                if(j_d-i_d+1<=length(fenetreDroite))
                    if(fenetre(j_d) == fenetreDroite(j_d-i_d+1))
                        longueur = longueur+1;
                    else
                        difference = fenetreDroite(j_d-i_d+1);
                        break;
                    end
                else
                    difference = fenetreDroite(1);
                end
            end
            possibilites = [possibilites;i_d longueur difference];
        end
        
        %on trouve le meilleur triplet de toutes les possibilites.
        meilleur_triplet = [0 0 fenetreDroite(1)];
        for i_rangee_possible = 1:length(possibilites)
            if(possibilites(i_rangee_possible,2)~=0)
                if(possibilites(i_rangee_possible,2) >= meilleur_triplet(2))
                    meilleur_triplet = possibilites(i_rangee_possible,:);
                end
            end
        end
        %on a le meilleur triplet. on l'ajoute au code.
        %fprintf('%d %d %d \n',meilleur_triplet);
        code = [code meilleur_triplet];
        
        decalage = meilleur_triplet(2) + 1;
        
        %on decale le dictionnaire
        dict = dict(1+decalage:end);
        %on colle ces valeurs a la fin du dict.
        dict = [dict fenetreDroite(1:min([length(fenetreDroite) decalage]))];
        
        %on ajuste la fenetreDroite.
        fenetreDroite = fenetreDroite(decalage+1:end);
        %on colle ces valeurs a la fin du dict. si il en reste
        if(~isempty(signal))
            fenetreDroite = [fenetreDroite signal(1:min(decalage, length(signal)))];
        end
        
        %on ajuste le signal:
        signal = signal(decalage+1:end);
        
        %on a fini de traiter le signal?
        if(isempty(fenetreDroite))
            continuer = 0;
        end
        
    end
end