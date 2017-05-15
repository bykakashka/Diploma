%TODO add more ideal digitals

function Diplom()
    clc;
    pathToImage = 'E:/Diploma/Diploma/math/testImages/';
    images = dir('testImages');
    
    for i=3:length(images)
        src = strcat(pathToImage, images(i).name);
        numbers = getNumberFromImage(src);
        
        fprintf('image %s : ', images(i).name);
        if isempty(numbers)
            fprintf('cant find numbers\n');
        else
            fprintf('%s\n', numbers);
        end
    end
end

