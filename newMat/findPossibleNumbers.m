function [ possibleNumbers ] = findPossibleNumbers( originalImage )
    image = processingImage(originalImage);
    
    framedImages = regionprops(image,'Area','Image','Orientation','BoundingBox', 'Extent');
    [a, b] = sort([framedImages.Area], 'descend');
    iData = framedImages(b);
    
    k=1;
    for i=1:min(10, length(iData))
        ratio = iData(i).BoundingBox(3)/iData(i).BoundingBox(4); 
        if (ratio > 1 && ratio < 7)
            possibleNumbers(k) = iData(i);
            bound = floor(iData(i).BoundingBox);
            possibleNumbers(k).Image = imcrop(originalImage,bound);
            k = k+1;
        end
    end
end

