function [Vecteur] = Zigzag(Matrice)

k = size(Matrice,1);
% Lecture en zigzag
inc = 0;
for i = 1 : k
    if mod(i,2)==0
        for j = 1 : i
            inc = inc+1;
            zig(inc,:) = [j, i-j+1];
        end
    else
        for j = i : -1 : 1
            inc = inc+1;
            zig(inc,:) = [j, i-j+1];
        end
    end
end
inc = 0;
for i = 2 : k
    if mod(i,2)==0
        for j = i : k
            inc = inc+1;
            zag(inc,:) = [k-j+i, j];
        end
    else
        for j = k : -1 : i
            inc = inc+1;
            zag(inc,:) = [k-j+i, j];
        end
    end
end
zigzag = [zig;zag];
clear zig zag

for i = 1 : k*k
    Vecteur(i,1) = Matrice(zigzag(i,1),zigzag(i,2));
end