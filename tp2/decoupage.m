function [blocs, m, n] = decoupage(image)
    [m n] = size(image);
    blocs = uint8(zeros(8,8,m/8*n/8));
    i_bloc=1;
    for i=1:m/8
        for j=1:n/8
            zone = image((i-1)*8+1:i*8, (j-1)*8+1:j*8);
            % coder ainsi pour eviter de recopier la matrice a chaque fois
            % (plus rapide que blocs = [blocs ; zone]; puisqu'on connais
            % deja le nombre de blocs final.
            blocs(:,:,i_bloc) = zone;
            i_bloc = i_bloc + 1;
        end
    end
end