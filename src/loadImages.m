function imageArray = loadImages(imageOrigin)
%Automated image loading from user specified image folder


    %Check if image folder is valid 
    if (isfolder(imageOrigin) == 0)
        %Dislay error message to user
        errMsg = sprintf("Specified folder: \n\n%s \n\ndoes not exist, please check entered folder path", imageOrigin);

        %Abort program execution, wait for user to resume
        uiwait(warndlg(errMsg));
        return;
    end

    imageFolder = uigetdir(imageOrigin);
    
    filePattern = fullfile(imageFolder, '*.png');
       
    %Store information about images into structure
    pngImages = dir(filePattern);
    
    %Reserve memory space for image cell array 
    imageArray = {};
    
    for i = 1:length(pngImages)
        
        baseFileName = pngImages(i).name;
        fullFileName = fullfile(imageFolder, baseFileName);
        
        imageArray{i} = imread(fullFileName);
        imshow(imageArray{i});
  

end