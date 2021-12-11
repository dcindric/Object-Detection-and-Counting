function  segmentedImages = Kmeans(imageEnhanced)

%Reserve memory space for segmented images 
segmentedImages = cell(numel(imageEnhanced));

%Define folder destination for segmented images
foldername = 'C:\Users\Dino\Desktop\SPUS-Projekt\KMEANS Images';


for i = 1:numel(imageEnhanced)
    
    %Image segmentation usign k-means clustering method 
    L = imsegkmeans(imageEnhanced{i}, 2);
    segmentedImages{i} = rgb2gray(labeloverlay(imageEnhanced{i}, L));
    gray_treshold = graythresh(segmentedImages{i});
    segmentedImages{i} = imbinarize(segmentedImages{i}, gray_treshold);
    
    %Write segmented images to disk
    filename = fullfile(foldername, sprintf('KMEANS_%d.png', i));
    imwrite(segmentedImages{i}, filename);
    

end 


segmentedImages = transpose(segmentedImages(:, 1));

end