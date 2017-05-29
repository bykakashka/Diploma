function [ possibleDigitals ] = findPossibleDigitals( number )
    image = processing2Image(number);
    image = imresize(image, [100 NaN]);
    framedImages = regionprops(image,'Area','Image','Orientation','BoundingBox');
    for i=1:length(framedImages)
        boxes(i) = framedImages(i).BoundingBox(4);
    end
    [a, b] = sort(boxes, 'descend');
    iData = framedImages(b);
    
    minBoundingSize = 20;
    i = 1;
    while (i <= length(iData) && iData(i).BoundingBox(4) > minBoundingSize)
        ratio = iData(i).BoundingBox(3)/iData(i).BoundingBox(4);
        while ( (ratio <= 0.15 || ratio > 1) && i < length(iData))
            i = i+1;
            ratio = iData(i).BoundingBox(3)/iData(i).BoundingBox(4);
        end
        element = iData(i);
        minDeviation = element.BoundingBox(4) * 0.2;
        
        k = 1;
        while (i <= length(iData) && abs(iData(i).BoundingBox(4) - element.BoundingBox(4)) < minDeviation)
            ratio = iData(i).BoundingBox(3)/iData(i).BoundingBox(4);
            if ratio > 0.15 && ratio < 1
               possibleDigitals(k) = iData(i);
               k = k + 1;
            end
            i = i+1;
        end
        
        if (k > 4)
            for j=1:length(possibleDigitals)
                digitalsBox(j) = possibleDigitals(j).BoundingBox(1);
            end
            [a, b] = sort(digitalsBox);
            possibleDigitals = possibleDigitals(b);
            return;
        end
    end
    
    possibleDigitals = logical.empty;
end

