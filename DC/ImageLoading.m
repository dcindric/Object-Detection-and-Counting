%Automated image loading and processing

%Change with your own folder path where images are stored
imageFolder = 'C:\Users\Dino\Desktop\SPUS-Projekt';


%Check if image folder is valid 
if (isfolder(imageFolder) == 0)
    %Dislay error message to user
    errMsg = sprintf("Specified folder: \n\n%s \n\ndoes not exist, please check entered folder path", imageFolder);
    
    %Abort program execution, wait for user to resume
    uiwait(warndlg(errMsg));
    return;
end


%Number of images to be processed
imageNumber = 10;

%Reserve memory space for image cell array
imgArray = {};

%Store information about images into structure
imageAll = dir('*.png');

%Extract image names from previously created image structure
imgList = {imageAll.name};


for i = 1:numel(imgList)
    imgArray{i} = imread(imgList{i});
    figure(i)
    imshow(imgArray{i})
end


    
    
    
    
    
    
    
    
    
    
