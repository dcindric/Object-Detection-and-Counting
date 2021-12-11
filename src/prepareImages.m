function imagePrepared = prepareImages(imageFolder)

    imageCellArray = loadImages(imageFolder);
    imagePrepared = imageResize(imageCellArray, 300, 300);
    
end 


