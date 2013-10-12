load('Heart/Heart.mat');

% Affichage du "film"
Mov = immovie(Trame,map);
movie(Mov)

% On obtient I1 et on la découpe
I1 = Trame(:,:,1,12);
[Blocs, M, N] = decoupage(I1);

% Nous n'étions pas sûrs s'il fallait faire sur tous les blocs ou sur un n
% arbitraire. Nous avons donc opter pout la boucle, mais l'appel de
% fonction reste le même dans les deux cas.
for n=1:size(Blocs,3)
    % Obtention du bloc n, puis utilisation de la fonction MatchBloc.
    B = Blocs(:,:,n);
    [EQM_min, position] = MatchBloc(B, n, Trame(:,:,1,11));
end