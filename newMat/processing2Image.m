function [ processingImage ] = processing2Image( originalImage )
    processingImage = imrotate(originalImage.Image, -1*originalImage.Orientation, 'bilinear');
    processingImage = rgb2gray(processingImage);

    processingImage = imadjust(processingImage);
    processingImage = medfilt2(processingImage,[3 3]);
    
    filt = fspecial('log',[7 7], 0.3);
    processingImage = imfilter(processingImage,filt);
    
    processingImage = im2bw(processingImage);
end

