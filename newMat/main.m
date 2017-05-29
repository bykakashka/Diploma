function [ carNumber ] = main( imageSrc )
    originalImage = imread(imageSrc);
    possibleNumbers = findPossibleNumbers(originalImage);
    
    [a, b] = sort([possibleNumbers.Extent]);
    sortedPossibleNumbers = possibleNumbers(b);
    maxAvg = 0;
    for i=1:length(sortedPossibleNumbers)
        possibleDigitals = findPossibleDigitals(sortedPossibleNumbers(i));
        [possibleCarNumber, avg] = translateImageToNumbers(possibleDigitals);
        
        if (length(possibleCarNumber) > 4)
            if (avg > maxAvg)
                carNumber = possibleCarNumber;
                maxAvg = avg;
            end
        end
        
    end
    if exist('carNumber') == 0
        carNumber = 'cant find number';
    end    
end