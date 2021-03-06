function [ digitalsInNumber ] = getDigitalsFromImages( digitals )
idealDigitals = initIdealDigitals();
digitalsCount = 1;
digitalsInNumber = '';
for i=1:length(digitals)    
    ImageToTest = imresize(digitals(i).Image,[64 64]);
    
    for j=1:length(idealDigitals)
        corrCoef(j) = corr2(ImageToTest, idealDigitals{j}.image);
    end
    
    maxCoef = 0;
    dig = 0;
    
    for j=1:length(idealDigitals)
        if maxCoef < abs(corrCoef(j))
            maxCoef = abs(corrCoef(j));
            dig = idealDigitals{j}.name;
        end
    end
    
    if (maxCoef > 0.25)
        digitalsInNumber(digitalsCount) = dig;
        digitalsCount = digitalsCount + 1;
   end
    
end
end

