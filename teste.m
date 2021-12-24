%%%%% O parâmetro 'img' é a imagem a ser filtrada %%%%%
%%%%% O parâmetro 'type' representa o tipo do filtro a ser utilizado(sendo 'l' para Laplaciano e 'g' para Laplaciano do Gaussiano) %%%%%
%%%%% O parâmetro 'one', representa se os elementos da borda do filtro serão todos 1/-1(caso seja true)%%%%%
%%%%% ou se serão 1/-1 alternados com 0(caso seja false) %%%%%
%%%%% O parâmetro 'center' representa o centro do filtro %%%%%
%%%%% Caso 'type' seja 'g' (Laplaciano do gaussiano), o parâmetro 'variance' representa a variância. %%%%%
%%%%% Neste caso, se não for passado o parâmetro 'variance', a variância será 1 por default. %%%%%
function ret = questao1(img, filter_type, one, center, variance)
    pkg load image
    close all
    clc

    %%%% Lendo e mostrando a imagem original %%%%
    I = imread(img);
    imshow(I);

    %%%% Gerando o filtro Laplaciano %%%%
    if one
        FL = ones(3);
    else
        FL = fspecial('laplacian', 0);
    endif
    if center > 0
        FL .*= -1;
    endif
    FL(2,2) = center;

    %%%% Gerando a imagem filtrada %%%%
    if filter_type == 'l'
        IF = imfilter(I, FL);
    elseif filter_type == 'g'
        if exist('variance')
            dp = sqrt(variance);
        else
            dp = 1;
            endif
        FG = fspecial('log', 3, dp);
        IF1 = imfilter(I, FG);
        J = I - IF1;
        IF = imfilter(J, FL);
    else
        close all;
        disp("Entrada de segundo paramentro(filter_type) invalida! Valores aceitos: 'g' e 'l'");
        return
    endif

    %%%% Somando a imagem filtrada à imagem original caso o centro %%%%
    %%%% do filtro seja positivo e subtraindo caso seja negativo %%%%
    if center > 0
        J = I + IF;
    else
        J = I - IF;
    endif
    figure;imshow(J);    


endfunction