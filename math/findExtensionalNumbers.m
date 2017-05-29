function [ extensionalImages ] = findExtensionalNumbers( originalImage )        
    image = prepareImage(originalImage);
    
%     image = image(:,:,:) == 0;
%     image = imopen(image, strel('disk', 2));
%     image = image(:,:,:) == 0;
    
    k = 1;
    minArea = 100;
    
    framedImages = regionprops(image,'Area','Image','Orientation','BoundingBox');
    [a, b] = sort([framedImages.Area], 'descend');
    Idata = framedImages(b);
    
    k = 1;
    for i=1:length(Idata)
        ratio = calculateRatio(Idata(i));

        convexArea = Idata(i).Area;
        if (ratio < 5.5) && (ratio > 2)
          if (convexArea > minArea)
            bound = floor(Idata(i).BoundingBox);
            pices(k) = Idata(i);
            pices(k).Image = imcrop(originalImage,bound);
            k = k + 1;
          end
        end
    end
    
    if exist('pices') == 1
        extensionalImages = pices;
    else
        extensionalImages = logical.empty;
    end
end

function [ratio] = calculateRatio(image) 
    if abs(image.Orientation) > 7.5
        alpha = image.Orientation*pi/180;
        s = sin(alpha);
        c = cos(alpha);
        a = image.BoundingBox(3);
        b = image.BoundingBox(4);
        
        x = (a*c - b*s) / (c^2 - s^2);
        y = (b*c - a*s) / (c^2 - s^2);
        ratio = x/y;
    else
        ratio = image.BoundingBox(3)/image.BoundingBox(4);
    end
end