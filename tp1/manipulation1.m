signal = uint8([0 0 1 0 1 0 2 1 0 2 1 0 2 1 2 4 0 1 0 1 0 2 1 0 0]);

signal_compresse = lz77(signal, 18, 9);
taux_compression = length(signal) / length(signal_compresse);