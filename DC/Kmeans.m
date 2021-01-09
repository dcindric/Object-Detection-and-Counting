function  [img_g] = Kmeans()

[ime_dat, put] = uigetfile('*.png' );          %odabir slike..odaberi izoštrenu sliku
img = (imread([put '\' ime_dat]));
%%

L = imsegkmeans(img, 2);         %kmeans segmentacija
B = labeloverlay(img, L);
B = im2gray(B);
t = graythresh(B);
BW = imbinarize(B,t);

figure('Name','kMeans segmentacija','NumberTitle','off');
subplot(1,2,1),imshow(img), title('originalna slika');
subplot(1,2,2), imshow(BW), title('segmentirana slika');

imwrite(BW, 'segmentirana_slika_Kmeans.jpg');

end
