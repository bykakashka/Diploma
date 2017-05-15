function [ number ] = getNumberFromImage( src )
    image = rgb2gray(imread(src));
    image = imresize(image, [400 NaN]);
    unrotatedNumbers = findExtensionalNumbers(image);
    
    for i=1:length(unrotatedNumbers)
        rotatedNumber = rotateExtensionalNumbers(unrotatedNumbers(i));
        
        for j=1:length(rotatedNumber)
            digitalsImages = findDigitalsImages(rotatedNumber(j));
        
            if ~isempty(digitalsImages)
                number = getDigitalsFromImages(digitalsImages);
                if length(number) > 3
                    return;
                end
            end
        end
    end
    number = logical.empty;
end

function [extensionalNumbers] = rotateExtensionalNumbers(unrotatedNumbers)
    if abs(unrotatedNumbers.Orientation) > 7
        rotatedImage = unrotatedNumbers;
        rotatedImage.Image = imrotate(unrotatedNumbers.Image, -1*unrotatedNumbers.Orientation);
        extensionalNumbers = findInRotatedImage(rotatedImage);
    else
        extensionalNumbers = unrotatedNumbers;
    end
end

function [extensionalNumber] = findInRotatedImage(originalImage)
    image = prepareImage(originalImage.Image);
    
    alpha = originalImage.Orientation*pi/180;
    s = sin(alpha);
    c = cos(alpha);
    a = originalImage.BoundingBox(3);
    b = originalImage.BoundingBox(4);

    x = (a*c - b*s) / (c^2 - s^2);
    y = (b*c - a*s) / (c^2 - s^2);
    
    k = 1;
    Idata = regionprops(image,'Area','Image','Orientation','BoundingBox','ConvexArea');
    for i=1:length(Idata)
        if ( abs(Idata(i).BoundingBox(3) - x) < x*0.5) && abs((Idata(i).BoundingBox(4) - y) < y*0.5)
            if abs(Idata(i).Area - originalImage.Area) < (originalImage.Area*0.1)
                bound = floor(Idata(i).BoundingBox);
                pices(k) = Idata(i);
                pices(k).Image = imcrop(originalImage.Image,bound);
                k = k + 1;
            end
        end
    end
    
    if k > 1
        extensionalNumber = pices(k-1);
    else 
        extensionalNumber = originalImage;
    end
end
