clc;
pathToImage = 'E:/Diploma/Diploma/math/testImages/';
image = '3.jpg';
%CarNumberRecognition(strcat(pathToImage, image));
extensionalNumbers = findExtensionalNumbers(strcat(pathToImage, image));

for i=1:length(extensionalNumbers)
    findDigitals(extensionalNumbers(i));
end