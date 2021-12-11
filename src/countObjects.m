function [numOfOlives, markedImages] = countObjects(segmentedImages, method)
   
    %Reserve memory space for marked images 
    markedImages = segmentedImages;
    
    %Define folder destination for marked images 
    foldername = 'C:\Users\Dino\Desktop\SPUS-Projekt\Final Output';
    
    %Number of olive trees counted, index in vector array corresponds to
    %number of olive trees counted on indexed image, for example:
    %numOfOlives(4) = 200 => on 4th image there is 200 olive trees 
    numOfOlives = zeros(1, numel(segmentedImages));
    
    
    for i = 1: numel(segmentedImages)
        
        figure
        
        imshow(markedImages{i})
        %d = imdistline();
          
        [centers, radii, metric] = imfindcircles(segmentedImages{i},[4 30],'ObjectPolarity','dark','Sensitivity',0.9); 
        
        hold on;
        
        
        viscircles(centers, radii,'EdgeColor','b');
  
        numOfOlives(i) = length(metric);
        
        title(['No. of trees:  ' num2str(numOfOlives(i))]);
        
        if (strcmp(method, "GMM"))
            filename = fullfile(foldername, sprintf('FINAL_GMM_%d.png', i));
        elseif (strcmp(method, "kmeans"))
            filename = fullfile(foldername, sprintf('FINAL_KMEANS_%d.png', i));
        else
            
        end
        
        print(filename, '-dpng')
        %imwrite(markedImages{i}, filename);

    end


end
