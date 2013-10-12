function [ EQM_min, position ] = MatchBloc( B, n, I0 )
    [M, N] = size(I0);
    block_dim = size(B,1);
    position = zeros(2,1);
    
    % Rangée et colonne courantes.
    block_row = mod(block_dim*n, N) + 1;
    block_col = ceil((block_dim*n)/N);
    
    % Nb de pixels à regarder autour.
    nb_around = 4;
    
    % On obtient le nombre de blocs autour du bloc B à aller chercher.
    rows_back = min(block_row - 1, nb_around);
    cols_back = min(block_col - 1, nb_around);
    rows_past = min(M - block_row - block_dim + 1, nb_around + block_dim);
    cols_past = min(N - block_row - block_dim + 1, nb_around + block_dim);
    
    % On set les débuts et fins pour les rangées et les colonnes.
    row_start = block_row - rows_back + (rows_back > 0) * 1;
    row_end = block_row + rows_past - (rows_past > 0) * 1;
    col_start = block_col - cols_back + (cols_back > 0) * 1;
    col_end = block_col + cols_past - (cols_past > 0) * 1;
    
    % EQM de départ non-défini
    EQM_min = NaN;
    for row = row_start:row_end
        for col = col_start:col_end
            % Calcul de EQM.
            EQM = (1 / block_dim^2) * sum(sum((B - double(I0(row:row+block_dim-1, col:col+block_dim-1))).^2));
            
            % Min entre EQM et EQM_min
            EQM_min = min(EQM_min, EQM);
            if(EQM == EQM_min)
                % Set la position si courant = EQM_min
                position = [row - row_start, col - col_start];
            end
            
            % Si EQM_min == 0 -> plus petit EQ
            if(EQM_min == 0)
                break;
            end
        end
        
        % Si EQM_min == 0 -> plus petit EQ
        if(EQM_min == 0)
             break;
        end
    end
    
    % On enlève rows_back + 1 et cols_back + 1 pour le vecteur de
    % mouvement.
    position = position - [rows_back+1, cols_back+1];
end

