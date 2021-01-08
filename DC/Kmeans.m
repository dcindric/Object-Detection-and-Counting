function  [] = Kmeans()

[ime_dat, put] = uigetfile('*.png' );          %odabir slike..odaberi izoštrenu sliku
img = (imread([put '\' ime_dat]));
%%

L = imsegkmeans(img, 2);         %kmeans segmentacija
B = labeloverlay(img, L);

figure('Name','kMeans segmentacija','NumberTitle','off');
subplot(1,2,1),imshow(img), title('originalna slika');
subplot(1,2,2), imshow(B), title('segmentirana slika');

imwrite(B, 'segmentirana_slika_Kmeans.jpg');

end