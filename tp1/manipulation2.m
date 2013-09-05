signal = imread('lena.gif'); % on charge l'image
signal = signal(:)'; % on transforme la matrice 2D vers un vecteur 1D.

resultat = lz77(signal, 32, 16)