function CarNumberRecognition(filename)
    originalImage = rgb2gray(imread(filename));
    image = originalImage;
    image = imadjust(image); %раст€гивание €ркости
    
    image = medfilt2(image,[3, 3]); % медианна€ фильтраци€. (убирание мелкого шума)
    
   % filt = fspecial('log',[7 7], 0.3); %детектор блобов
    %image = imfilter(image,filt);
    
    image = edge(image, 'log');
    imshow(image);
    
    image = image(:,:,:) < 150; %отделение фона от объекта

    image = imopen(image,strel('disk',2)); %замыкание контуров
    image = (bwlabel(image,8));

    coloredImage = label2rgb(image);
    figure;
    imshow(coloredImage);
end

