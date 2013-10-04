voiture_ori = imread('Car.bmp');
voiture_blocs = double(decoupage(voiture_ori));


%on dct2 les blocs
for b=1:size(voiture_blocs,3)
    voiture_blocs(:,:,b) = dct2(voiture_blocs(:,:,b));
end


%on iDCT2 les blocs
for b=1:size(voiture_blocs,3)
    voiture_blocs(:,:,b) = idct2(voiture_blocs(:,:,b));
end

%on recolle les blocs
voiture_finale = idecoupage(voiture_blocs, size(voiture_ori, 1), size(voiture_ori, 2));

diff = abs(voiture_finale-voiture_ori);

figure
subplot(1,3,1)
imshow(voiture_ori)
subplot(1,3,2)
imshow(voiture_finale)
subplot(1,3,3)
imshow(diff)