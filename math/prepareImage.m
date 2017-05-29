function [ processingImage ] = prepareImage( originalImage )
    image = imadjust(originalImage);
    image = medfilt2(image,[3 3]);
    
    filt = fspecial('log',[7 7], 0.3);
    image = imfilter(image,filt);
    
    image = im2bw(image);
    processingImage = image;
end

