function [ digitals, isFind ] = findDigitals( image )    
    image = prepareImage(image.Image);
    
    image = imresize(image,[400 NaN]);
    
    figure;
    imshow(image);
    
    probdigits = regionprops(image,'Area','Image','Orientation','BoundingBox','ConvexArea');
    for i=1:length(probdigits)
        ratio = probdigits(i).BoundingBox(3)/probdigits(i).BoundingBox(4);
        if probdigits(i).Area > 2200 && ratio < 0.7 && ratio > 0.1
            figure;
           imshow(probdigits(i).Image);
        end
    end
    
end

