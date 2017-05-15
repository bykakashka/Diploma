function [ digitals, isFind ] = findDigitalsImages( image )    
    image = prepareImage(image.Image);
%     image = imresize(image, [400 NaN]);
    k = 1;
    
    allProbdigits = regionprops(image,'Area','Image','Orientation','BoundingBox','ConvexArea');
    [a, b] = sort([allProbdigits.Area], 'descend');
    probdigits = allProbdigits(b);
    
   for i=1:min(15, length(probdigits))
%     for i=1:length(allProbdigits)
%             if allProbdigits(i).Area > 3750
                ratio = probdigits(i).BoundingBox(3)/probdigits(i).BoundingBox(4);
                if ratio > 0.25 && ratio < 1
                   digitalsPositions(k) = b(i);
%                    digitals(k) = allProbdigits(i);
                   k = k + 1;
                end
%             end        
    end
    
    isFind = false;
    if exist('digitalsPositions') == 1 && length(digitalsPositions) > 5
        isFind = true;
       test = sort(digitalsPositions);
       digitals = allProbdigits(test);
    else
        digitals = logical.empty;
    end

end

