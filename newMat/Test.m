function [  ] = Test( )
    images = dir('numbers');
    
    for i=3:length(images)
        src = images(i).name;
        display(strcat(src, ' : ', main(src)));
    end
end

