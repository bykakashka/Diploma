function [ processingImage ] = prepareImage( originalImage )
    image = imadjust(originalImage);
    image = medfilt2(image,[3 3]);
    
    filt = fspecial('log',[7 7], 0.3);
    image = imfilter(image,filt);
    
    processingImage = image(:,:,:) > 150;
%    
%    countColor = uint64(0);
%    for i = 1:numel(image)
%        countColor = countColor + uint64(image(i));
%    end
%    sizePixel = i;
%    average = countColor/sizePixel;
    
%    ProcessingImage = image(:,:) > average;

end

