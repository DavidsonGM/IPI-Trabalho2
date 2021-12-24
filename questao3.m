pkg load image

im = imread('pcb.jpg');
im = im2bw(im);

for i=3:2:11
 SE = strel('disk',i, 0)
 im_e = imerode(im,SE);
 imshow(im_e); pause;
end

for i=3:2:11
 SE = strel('square',i)
 im_e = imerode(im,SE);
 imshow(im_e); pause;
end

 SE = strel('line',10,45)
 im_e = imerode(im,SE);
 imshow(im_e); pause;

 
 SE2 = zeros(7,7)
 SE2(2:7,5:7) = 1;
 SE2(2:3,:) = 1;
 im_e = imerode(im,SE2);
 imshow(im_e); pause;