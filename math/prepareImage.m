function [ processingImage ] = prepareImage( originalImage )
    image = imadjust(originalImage);
    image = medfilt2(image,[3 3]);
    
    filt = fspecial('log',[7 7], 0.3);
    image = imfilter(image,filt);
    
    image = image(:,:,:) > 150;

    processingImage = image;
end

