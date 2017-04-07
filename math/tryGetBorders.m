function [ result ] = tryGetBorders( src )
    originalImage = rgb2gray(imread(src));
    image = originalImage;
    
    figure; imshow(image); title('bwimage');
    image = prepareImage(image);
    
    images = parse(originalImage, image);
    
    size = numel(images);
    for i = 1:size
        figure; imshow(images(i).Image); title(i);
    end
end