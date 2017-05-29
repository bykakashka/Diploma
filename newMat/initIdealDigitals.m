function [ idealDigitals ] = initIdealDigitals( )
    folders = dir('idealDigitals');
    k = 1;
    for i=3:length(folders)
        
        folderPath = strcat('idealDigitals/', folders(i).name);
        
        files = dir(folderPath);
        for j=3:length(files)
            image = files(j).name;
            src = strcat(folderPath, '/', image);
            
            idealDigitals{k}.image = imresize(rgb2gray(imread(src)) < 150,[64 64]); 
            idealDigitals{k}.name = folders(i).name;
            k = k + 1;
        end
    end

end

