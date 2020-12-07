pic01 = imread('SIG_01.png');
pic02 = imread('SIG_02.png');
pic03 = imread('SIG_03.png');


%Inicijalna slika
figure(1)
title('Inicijalna slika')
imshow(pic01)

%Histogram inicijalne slike
figure(2)
title('Histogram inicijalne slike')
imhist(pic01)


%Ujednačavanje inteziteta/poboljšavanje kontrasta inic. slike
pic01_histeq = histeq(pic01);
figure(3)
title('Slika s poboljšanim kontrastom')
imshow(pic01_histeq)

%Prikaz histograma slike poboljšanog kontrasta
figure(4)
title('Histogram slike poboljšanog kontrasta')
imhist(pic01_histeq)


%Pretvorba RGB u grayscale (crno-bijeli format)
pic01_gs = rgb2gray(pic01_histeq);
figure(5)
title('Grayscale slika')
imshow(pic01_gs)

%Poboljšanje kontrasta grayscale slike
pic01_gs_improved = imadjust(pic01_gs);


%Poboljšavanje oštrine slike metodom imsharpen koja koristi tehniku unsharp
%masking
pic01_gs_sharp = imsharpen(pic01_gs_improved)
figure(6)
title('Poboljšani kontrast grayscale slike')
imshow(pic01_gs_sharp)











