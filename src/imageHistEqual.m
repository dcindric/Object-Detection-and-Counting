function imageHistEqualiazed = imageHistEqual(imageArrayResized)
%Histogram equalization for all images, applied to resized images, in order
%to improve contrast of an image

    %Reserve memory space for equalized images
    imageHistEqualiazed = cell(numel(imageArrayResized));

    for i = 1: numel(imageArrayResized)
        imageHistEqualiazed{i} = histeq(imageArrayResized{i});
        %figure
        %imshow(imageHistEqualiazed{i})
    end 
    
    %Extract first column and transpose it (from column-vector to
    %row-vector)
    imageHistEqualiazed = transpose(imageHistEqualiazed(:, 1));
    
end


