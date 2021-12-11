function imageSharp = unsharpMask(imageGray)
%Image sharpening using unsharp masking technique

%Reserve memory space for sharpened images 
    imageSharp = cell(numel(imageGray));
    
    for i = 1:numel(imageGray)
        imageSharp{i} = imsharpen(imageGray{i});
        figure
        imshow(imageSharp{i})
    end


    imageSharp = transpose(imageSharp(1, :));
    
end

