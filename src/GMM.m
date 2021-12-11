function GMMImage = GMM(processedImage)

%K value for GMM 
K = 3;                         

%Reserve memory space for reshaped data matrix and Gaussian model
imageData = cell(numel(processedImage));
imageData = transpose(imageData(:, 1));

gaussMixture = cell(numel(processedImage));
gaussMixture = transpose(gaussMixture(:, 1));


for i = 1:numel(processedImage)
    
    [n,m,d] = size(processedImage{i});
    imageData{i} = reshape(double(processedImage{i}), n*m, d);
    gaussMixture{i} = fitgmdist(imageData{i}, K,'Options',statset('MaxIter',500),'SharedCov', true);
    
end


%Reserve memory space for posterior probabilites and other temporarily used
%variables
probs = cell(numel(processedImage));
max_g = cell(numel(processedImage));


%% Change every pixel with value in the center of the cluster
for i = 1:numel(processedImage)
    
    probs{i} = posterior(gaussMixture{i}, imageData{i});
    [~, max_g{i}] = max(probs{i}, [], 2);
    max_g{i} = reshape(max_g{i}, n, m);
    

end


%Reserve memory space for segmented images 
GMMImage = processedImage;

%Define folder destination for GMM images
foldername = 'C:\Users\Dino\Desktop\SPUS-Projekt\GMM Images';

for n = 1:numel(processedImage)
    
    for i = 1:n
        
        for j =1:m
            
           GMMImage{i}(i,j,:) = gaussMixture{i}.mu(max_g{i}(i,j),:);
           
        end
        
        %Write GMM images to disk 
        filename = fullfile(foldername, sprintf('GMM_%d.png', i));
        imwrite(GMMImage{i}, filename);
        
    end
    

    
end


end