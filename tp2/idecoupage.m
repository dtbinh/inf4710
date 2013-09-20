function [ image ] = idecoupage( blocs, m, n )
    %on pre-alloue la matrice pour accelerer le code.
    %evite de recopier la matrice a chaque bloc lors de la boucle.
    image = zeros(n,m);
    
    for i=1:size(blocs, 3)
        u1 = mod((i-1)*8, m)+1;
        u2 = u1 + 7;
        v1 = (ceil(i/(m/8))-1)*8+1;
        v2 = v1 + 7;
        image(v1:v2,u1:u2) = blocs(:,:,i);
    end

end

