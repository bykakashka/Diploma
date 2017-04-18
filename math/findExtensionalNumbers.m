function [ extensionalImages ] = findExtensionalNumbers( src )
    originalImage = rgb2gray(imread(src));    
    image = prepareImage(originalImage);
    
    k = 1;
    minConvexArea = numel(image) * 0.1; %min 10%
    maxConvexArea = numel(image) * 0.5; %max 20%
    
    Idata = regionprops(image,'Area','Image','Orientation','BoundingBox','ConvexArea');
    for i=1:length(Idata)
      ratio = Idata(i).BoundingBox(3)/Idata(i).BoundingBox(4);

      convexArea = Idata(i).ConvexArea;
      if (convexArea > minConvexArea) && (convexArea < maxConvexArea) && (ratio < 7) && (ratio > 2)
        bound = floor(Idata(i).BoundingBox);
        pices(k) = Idata(i);
        pices(k).Image = imcrop(originalImage,bound);
        k = k + 1;
      end
    end
    
    extensionalImages = pices;
end