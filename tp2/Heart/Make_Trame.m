for i = 1 : 38
    if i < 10
        Trame(:,:,1,i) = imread(['heart.00' num2str(i) '.png']);
    else
        Trame(:,:,1,i) = imread(['heart.0' num2str(i) '.png']);
    end
end

map = [linspace(0,1,256)'  linspace(0,1,256)'  linspace(0,1,256)' ];

mov = immovie(Trame,map);
movie(mov)

for i = 1 : size(Trame,4)
    figure
    imshow(Trame(:,:,1,i))
end