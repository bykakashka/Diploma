clc;
original = imread('E:/Diploma/Diploma/math/testImages/011-21OO.jpg');
original = rgb2gray(original);
original = im2bw(original);

image = imopen(original, strel('disk',2));

imshow(original);
figure; imshow(image);

