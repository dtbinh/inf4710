function code=lz77 (signal, tailleFG, tailleDict)
    % signal : le signal à coder (entrée de l’algorithme).
    % tailleFG : la taille de la fenêtre glissante.
    % tailleDict : la taille du dictionnaire.
    % code : un vecteur de type uint8 (résultat du codage LZ77).
    
    % on init le dictionnaire avec des uint8(0) et on prend
    % les 
    dict = uint8(zeros(1, tailleDict));
    fenetreDroite = signal(1:tailleFG-tailleDict);
    fenetre = [dict fenetreDroite];
        
    code = [];
    
    %index sur le signal quon compresse
    i=1;
    while(i<=size(signal,2))
        % on commence par chercher une occurence dans le dict.
        meilleurIndexDict = 0;
        meilleurLongueur = 0;
        for iD=1:tailleDict
            if(dict(iD)==signal(i))
                % on a trouve un debut possible. on regarde quelle longueur
                % max on peut faire:
                
                %1: on copie l'index:
                jD = iD+1;
                
                %2: on cherche la longueur max:
                while(jD <= tailleFG)
                    if(dict(iD) == signal(i+(jD-iD)))
                        % PAS FINI, RENDU ICI! D'AILLEUR, LA CONDITION DANS
                        % LE IF LAISSE A DESIRER.
                        jD = jD + 1;
                    else
                        break;
                    end
                end
                
                %3: si cette longueur est mieux, on en prend note.
                cetteLongueur = jD - iD;
                if(cetteLongueur>=meilleurLongueur)
                    meilleurLongueur = cetteLongueur;
                    meilleurIndexDict = iD;
                end
            end
        end
        % on a trouve la plus longue sequence.
        % si aucune a ete trouvee, (mailleurLongueur = 0),
        if(meilleurLongueur == 0)
            % on ajoute le triplet (0, 0, valeur) a la sortie.
            triplet = [0 0 signal(i)];
        else
            % sinon, on ajoute le triplet suivant: 
            %index 1: combien de symboles derriere est-ce quon a trouve la
            %suite?
            triplet(1) = tailleDict - meilleurIndexDict;
            %quelle est sa longueur?
            triplet(2) = meilleurLongueur;
            %quel symbole stoppe la suite?
            triplet(3) = #$#$#$#$#$;
        end
        
        
        code = [code triplet];
        i=i+1;
    end
end