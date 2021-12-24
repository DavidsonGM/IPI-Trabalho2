im = imread('pcb.jpg');
im1 = im2bw(im, 0);
% im1 = ~im2bw(im,0);
figure; imshow(im1);
pause;

strel1 = strel('disk',2, 0);
im2 = imclose(im1,strel1);
figure; imshow(im2);
pause;

im3 = imfill(im2,'holes');
figure; imshow(im3);
pause;

im4 = im3 & ~im1;
figure; imshow(im4);
pause;

strel2 = strel('disk',3, 0);
im5 = imopen(im4,strel2);
figure; imshow(im5);
pause;

[~,numCC] = bwlabel(im5);
fprintf('Number of holes equals:\t%d\n',numCC)