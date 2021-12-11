function grayImage = rgb2grayscale(imageArrayResized)
%RGB to grayscale conversion

%Reserve memory space for grayscale images in form of a cell array
    grayImage = cell(numel(imageArrayResized));
    
    for i = 1:numel(imageArrayResized)
        grayImage{i} = rgb2gray(imageArrayResized{i});
%         figure
%         imshow(grayImage{i})
    end 
    
    grayImage = transpose(grayImage(:, 1));
    
end
        