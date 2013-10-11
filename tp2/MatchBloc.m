function [ EQM_min, position ] = MatchBloc( B, n, I0 )
    [M, N] = size(I0);
    block_dim = size(B,1);
    position = zeros(2,1);
    
    block_row = mod(block_dim*n, N) + 1;
    block_col = ceil((block_dim*n)/N);
    
    nb_around = 2;
    rows_back = min(block_row - 1, nb_around);
    cols_back = min(block_col - 1, nb_around);
    rows_past = min(M - block_row, nb_around);
    cols_past = min(N - block_col, nb_around);
    row_start = block_row-rows_back*block_dim + (rows_back > 0) * 1;
    row_end = block_row+(rows_past+1)*block_dim - (rows_back == 0) * 1;
    col_start = block_col-cols_back*block_dim + (cols_back > 0) * 1;
    col_end = block_col+(cols_past+1)*block_dim - (cols_back == 0) * 1;
    region_blocks = decoupage(I0(row_start:row_end,col_start:col_end));
    
    EQM_min = NaN;
    for i = 1:size(region_blocks,3)
        EQM = (1 / block_dim^2) * sum(sum((B - region_blocks(:,:,i)).^2));
        fprintf('%f\n', EQM);
        EQM_min = min(EQM_min, EQM);
        if(EQM == EQM_min)
            position = size(region_blocks(:,:,i));
        end
        
        if(EQM_min == 0)
            break;
        end
    end
    
    position = position * block_dim;
    position(1) = position(1) - (rows_back+1) * block_dim;
    position(2) = position(2) - (cols_back+1) * block_dim;
end

