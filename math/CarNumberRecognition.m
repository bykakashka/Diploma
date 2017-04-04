function CarNumberRecognition(filename)
    originalImage = rgb2gray(imread(filename));
    image = originalImage;
    image = imadjust(image); %������������ �������
    
    image = medfilt2(image,[3, 3]); % ��������� ����������. (�������� ������� ����)
    
   % filt = fspecial('log',[7 7], 0.3); %�������� ������
    %image = imfilter(image,filt);
    
    image = edge(image, 'log');
    imshow(image);
    
    image = image(:,:,:) < 150; %��������� ���� �� �������

    image = imopen(image,strel('disk',2)); %��������� ��������
    image = (bwlabel(image,8));

    coloredImage = label2rgb(image);
    figure;
    imshow(coloredImage);
end

