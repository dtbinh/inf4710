mat_qlty = MatQuant(10);

voiture_ori = imread('Car.bmp');
voiture_blocs = decoupage(voiture_ori);


%on dct2 les blocs
for b=1:size(voiture_blocs,3)
    voiture_blocs(:,:,b) = dct2(voiture_blocs(:,:,b));
end

%quantification
for b=1:size(voiture_blocs,3)
    voiture_blocs(:,:,b) = round(voiture_blocs(:,:,b) ./ mat_qlty);
end

%on a plus de virgules alors on transfert en uint8 pour sauver de la
%memoire.
voiture_blocs = uint8(voiture_blocs);

%zigzaggation
voiture_zigzagged = uint8(zeros(8*8, size(voiture_blocs,3)));
for b=1:size(voiture_blocs,3)
    voiture_zigzagged(:,b) = Zigzag(voiture_blocs(:,:,b));
end


%enlignement de tous les blocs sur un seul string:
prehuff_string=uint8(zeros(1, size(voiture_zigzagged, 1) * size(voiture_zigzagged, 2)));

%on colle les zigzags pour eviter de recreer un dictionnaire a chaque bloc
%avec huffman, c'est plus efficace avec une longue chaine plutot que 64
%symboles seulement.
for i=1:size(voiture_zigzagged,2)
    prehuff_string(((i-1)*size(voiture_zigzagged,1)-1)+2:((i)*size(voiture_zigzagged,1)-1)+1) = voiture_zigzagged(:,i);
end

%on fait huffman sur la chaine concatenee de tout
final_string = mat2huff(prehuff_string);
