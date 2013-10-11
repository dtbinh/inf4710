load('Heart/Heart.mat');

% Affichage du "film"
Mov = immovie(Trame,map);
movie(Mov)

% On obtient I1 et on la découpe
I1 = Trame(:,:,1,12);
[Blocs, M, N] = decoupage(I1);

% n arbitraire?
n = floor(size(Blocs,3)/2);

% Obtention du bloc n, puis utilisation de la fonction MatchBloc.
B = Blocs(:,:,n);
[EQM_min, position] = MatchBloc(B, n, Trame(:,:,1,11));