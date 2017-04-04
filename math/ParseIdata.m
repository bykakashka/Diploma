function ParseIdata(Idata, im)
    k = 1;
    for i=1:length(Idata)
      ratio = Idata(i).BoundingBox(3)/Idata(i).BoundingBox(4);
      if Idata(i).ConvexArea > 500 && ratio < 7 && ratio > 2.5
        bound = floor(Idata(i).BoundingBox);
        numbers(k) = Idata(i);
        numbers(k).Image = imcrop(im,bound);
        figure;
        imshow(numbers(k).Image);
        k = k +1;
      end
    end
end

