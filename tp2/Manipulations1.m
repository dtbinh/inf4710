voiture_ori = imread('Car.bmp');
voiture_blocs = decoupage(voiture_ori);


%on dct2 les blocs
for b=1:size(voiture_blocs,3)
    voiture_blocs(:,:,b) = dct2(voiture_blocs(:,:,b));
end

w
%on iDCT2 les blocs
for b=1:size(voiture_blocs,3)
    voiture_blocs(:,:,b) = idct2(voiture_blocs(:,:,b));
end

%on recolle les blocs
voiture_finale = idecoupage(voiture_blocs, size(voiture_ori, 1), size(voiture_ori, 2));

car_diff = abs(voiture_finale-voiture_ori);

%on affiche les 3 images: ori, final, diff.
figure
subplot(1,3,1)
imshow(voiture_ori)
subplot(1,3,2)
imshow(voiture_finale)
subplot(1,3,3)
imshow(car_diff)

%% fleur
fleur_ori = imread('Fleurs.bmp');
fleur_blocs = decoupage(fleur_ori);


%on dct2 les blocs
for b=1:size(fleur_blocs,3)
    fleur_blocs(:,:,b) = dct2(fleur_blocs(:,:,b));
end


%on iDCT2 les blocs
for b=1:size(fleur_blocs,3)
    fleur_blocs(:,:,b) = idct2(fleur_blocs(:,:,b));
end

%on recolle les blocs
fleur_final = idecoupage(fleur_blocs, size(fleur_ori, 1), size(fleur_ori, 2));

fleur_diff = abs(fleur_final-fleur_ori);

%on affiche les 3 images: ori, final, diff.
figure
subplot(1,3,1)
imshow(fleur_ori)
subplot(1,3,2)
imshow(fleur_final)
subplot(1,3,3)
imshow(fleur_diff)

%% lion
lion_ori = imread('Lion.bmp');
lion_blocs = decoupage(lion_ori);


%on dct2 les blocs
for b=1:size(lion_blocs,3)
    lion_blocs(:,:,b) = dct2(lion_blocs(:,:,b));
end


%on iDCT2 les blocs
for b=1:size(lion_blocs,3)
    lion_blocs(:,:,b) = idct2(lion_blocs(:,:,b));
end

%on recolle les blocs
lion_final = idecoupage(lion_blocs, size(lion_ori, 1), size(lion_ori, 2));

lion_diff = abs(lion_final-lion_ori);

%on affiche les 3 images: ori, final, diff.
figure
subplot(1,3,1)
imshow(lion_ori)
subplot(1,3,2)
imshow(lion_final)
subplot(1,3,3)
imshow(lion_diff)