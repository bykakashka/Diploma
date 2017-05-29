function [ processedImage ] = processingImage( image )
    processedImage=rgb2gray(image);
        
    processedImage = imadjust(processedImage);
    processedImage = medfilt2(processedImage,[3 3]);
    filterSize = size(processedImage);
    processedImage = edge(processedImage,'Canny', [0.4 0.5]);
    processedImage = bwlabel(processedImage,8);
end