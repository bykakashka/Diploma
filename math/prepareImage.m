function [ ProcessingImage ] = prepareImage( originalImage )
    image = imadjust(originalImage);
    countColor = uint64(0);
    for i = 1:numel(image)
        countColor = countColor + uint64(image(i));
    end
    sizePixel = i;
    average = countColor/sizePixel;
    
    ProcessingImage = image(:,:) > average;
end

