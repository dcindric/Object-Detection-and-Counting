function imageArrayResized = imageResize(imageArray, numRows, numColumns)
%Resizing image to user specified [rows, columns]

    %Reserve memory space for resized images cell array
    imageArrayResized = cell(numel(imageArray));

    for i = 1: numel(imageArray)
        imageArrayResized{i} = imresize(imageArray{i}, [numRows, numColumns]);
        %imshow(imgArray_resized{i})
    end
    
    %Extract only first column and transpose it (from column-vector to row
    %vector 
    imageArrayResized = transpose(imageArrayResized(:, 1));
    
end


