function [ pices ] = parse( originalImage, image )
k = 1;
Idata = regionprops(image,'Area','Image','Orientation','BoundingBox','ConvexArea');
for i=1:length(Idata)
  ratio = Idata(i).BoundingBox(3)/Idata(i).BoundingBox(4);
  if ( i== 14)
      figure();
      imshow(Idata(i).Image);
  end
  
  if Idata(i).ConvexArea > 500 && ratio < 7 && ratio > 2
    bound = floor(Idata(i).BoundingBox);
    pices(k) = Idata(i);
    pices(k).Image = imcrop(originalImage,bound);
    k = k +1;
  end
end
end

