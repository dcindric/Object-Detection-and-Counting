close all;
clear all;

sig01 = imread('SIG_01.png');
sig02 = imread('SIG_02.png');
sig03 = imread('SIG_03.png');


imag_array = [sig01 sig02];


%Inicijalna slika
figure(1)
title('Inicijalna slika')
imshow(sig01)

%Histogram inicijalne slike
figure(2)
title('Histogram inicijalne slike')
imhist(sig01)


%Ujednačavanje inteziteta/poboljšavanje kontrasta inic. slike
sig01_histeq = histeq(sig01);
figure(3)
title('Slika s poboljšanim kontrastom')
imshow(sig01_histeq)

%Prikaz histograma slike poboljšanog kontrasta
figure(4)
title('Histogram slike poboljšanog kontrasta')
imhist(sig01_histeq)


%Pretvorba RGB u grayscale (crno-bijeli format)
sig01_gs = rgb2gray(sig01_histeq);
figure(5)
title('Grayscale slika')
imshow(sig01_gs)

%Poboljšanje kontrasta grayscale slike
sig01_gs_improved = imadjust(sig01_gs);


%Poboljšavanje oštrine slike metodom imsharpen koja koristi tehniku unsharp
%masking
sig01_gs_sharp = imsharpen(sig01_gs_improved);
figure(6)
title('Poboljšani kontrast grayscale slike')
imshow(sig01_gs_sharp)



%RGB = imread('SIG_01.png');
RGB = sig01_gs_sharp;
%%
%za izradu maske za poboljšani prikaz na kraju
%imhist(sig01_gs_sharp)              %za određivanje razina piksela koje mozemo maknuti i koje smetaju
%manji = (sig01_gs_sharp < 32);
%veci = (sig01_gs_sharp > 154);
                     
%sig01_gs_sharp(manji) = 0;         %pomocna matrica
%sig01_gs_sharp(veci) = 255;
%%

L = imsegkmeans(RGB, 2);         %kmeans segmentacija
B = labeloverlay(RGB, L);

%gray_im = im2gray(B);
%A = gray_im+sig01_gs_sharp;
%find_edges(B)                   %detekcija rubova

figure()
subplot(1,2,1),imshow(sig01), title('originalna slika');
subplot(1,2,2), imshow(B), title('segmentirana slika');

imwrite(B, 'segmentirana_slika_Kmeans.jpg');
%imwrite(uint8(g), 'img_smooth.jpg');
%e = edge(A, 'log');    %detekcija rubova