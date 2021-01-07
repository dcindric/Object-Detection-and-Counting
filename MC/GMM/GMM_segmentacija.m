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


%Poboljšavanje oštrine slike metodom imsharpen koja koristi tehniku unsharp
%masking
sig01_gs_sharp = imsharpen(sig01_histeq);

figure(6)
title('Poboljšani kontrast grayscale slike')
imshow(sig01_gs_sharp)
imwrite(sig01_gs_sharp, 'izoštrena slika.png');

%%
[FileName,PathName] = uigetfile('*.png' );          %odabir slike..odaberi izoštrenu sliku
I= double(imread([PathName '\' FileName]));

K = 2;                      % K za GMM
[n,m,d] = size(I);
data = reshape(I, n*m,3);   % 2D matrica


gmm = fitgmdist(data, K,'Options',statset('MaxIter',500));

%% Zamijena svakog piksela s vrijednošću u središtu klastera

Postpp = posterior(gmm,data) ;
[~,mg] = max(Postpp,[],2);

mg = reshape(mg, n,m);
im_res_2 = I;

for i = 1:n
    for j =1:m
       im_res_2(i,j,:) = gmm.mu(mg(i,j),:);
    end
end

imwrite(uint8(im_res_2), 'segmentirana_slika_GMM.jpg');

figure('Name','Second method','NumberTitle','off');
subplot(221); imshow(uint8(I)); title('Početna slika') 
subplot(222); imshow(uint8(im_res_2)); title([' K = ' num2str(K)])

%find_edges(uint8(im_res_2))