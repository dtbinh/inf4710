signal = imread('lena.gif'); % on charge l'image
signal = signal(:)'; % on transforme la matrice 2D vers un vecteur 1D.

signal_compresse = lz77(uint8(signal), 32, 16);
taux_compression = length(signal) / length(signal_compresse);