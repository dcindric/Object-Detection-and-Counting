function imageEnhanced = enhanceImage(imagePrepared)
%Loads prepared images and enhances images     

    %RGB to grayscale conversion
    imageGrayscale = rgb2grayscale(imagePrepared);

    %Histogram equalization of images 
    %imageEqualized = imageHistEqual(imageGrayscale);

    %Better results were achieved with Laplacian filter
    %img_sharp = unsharpMask(imageGrayscale);

    imageEnhanced = laplacianFilter(imageGrayscale);
    
end

