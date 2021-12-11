function saveImages(processedImages)
%Saves processed images to disk

%Define save folder destination 
foldername = 'C:\Users\Dino\Documents\SPUS-Projekt\Processed Images';
    for i = 1: numel(processedImages)
        
        filename = fullfile(foldername, sprintf('OBR_%d.png', i));
        imwrite(processedImages{i}, filename);
        
    end
    
end

