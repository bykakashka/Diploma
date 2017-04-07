function CarNumberRecognition(filename)
    originalImage = rgb2gray(imread(filename));
    image = originalImage;
    image = imadjust(image); %������������ �������
    
    image = medfilt2(image,[3, 3]); % ��������� ����������. (�������� ������� ����)
    
   % filt = fspecial('log',[7 7], 0.3); %�������� ������
    %image = imfilter(image,filt);
    
    image = edge(image, 'log');
    
    image = image(:,:,:) < 150; %��������� ���� �� �������
    dispImage(image, 'after fon');
    
    imageAfterClosure = imopen(image,strel('disk',2)); %��������� ��������
    imageAfterClosure = (bwlabel(image,8));
    
    dispImage(imageAfterClosure, 'after closure');
    
    coloredImage = label2rgb(imageAfterClosure);
end

