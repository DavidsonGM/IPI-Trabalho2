I = imread('pcb.jpg');
I1 = im2bw(I, 0);
imshow(I1);

strel1 = strel('disk', 2, 0);
I2 = imclose(I1, strel1);

I3 = imfill(I2, 'holes');

I4 = I3 & ~ I1;

strel2 = strel('disk', 2, 0);
I5 = imopen(I4, strel2);

imshow(I5);
[~,NB] = bwlabel(I5);
disp('Numero de buracos: '); NB

allCentroids = [regionprops(I5).Centroid];
xCentroids = allCentroids(1:2:end);
yCentroids = allCentroids(2:2:end);

CM1 = [xCentroids(1) yCentroids(1)];
CM1 = int8(CM1);

TodasAreas = [regionprops(I5).Area];
A1 = TodasAreas(1);
R1 = int8(sqrt(A1/pi));

for i = R1:size(I)(1)
    strel3 = strel('disk', i, 0);
    I6 = imclose(I, strel3);
    if !(I6(CM1(1), CM1(2)) == 0)
        diametro = i*2
        imshow(I6);
        break;
    endif
end