sig01 = imread('SIG_01.png');
sig02 = imread('SIG_02.png');
sig03 = imread('SIG_03.png');




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
sig01_gs_sharp = imsharpen(sig01_gs_improved)
figure(6)
title('Poboljšani kontrast grayscale slike')
imshow(sig01_gs_sharp)






