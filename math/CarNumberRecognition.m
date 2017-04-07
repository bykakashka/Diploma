function CarNumberRecognition(filename)
    originalImage = rgb2gray(imread(filename));
    image = originalImage;
    image = imadjust(image); %раст€гивание €ркости
    
    image = medfilt2(image,[3, 3]); % медианна€ фильтраци€. (убирание мелкого шума)
    
   % filt = fspecial('log',[7 7], 0.3); %детектор блобов
    %image = imfilter(image,filt);
    
    image = edge(image, 'log');
    
    image = image(:,:,:) < 150; %отделение фона от объекта
    dispImage(image, 'after fon');
    
    imageAfterClosure = imopen(image,strel('disk',2)); %замыкание контуров
    imageAfterClosure = (bwlabel(image,8));
    
    dispImage(imageAfterClosure, 'after closure');
    
    coloredImage = label2rgb(imageAfterClosure);
end

