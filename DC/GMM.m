function [] = GMM()

[ime_dat, put] = uigetfile('*.png' );          %odabir slike..odaberi izoštrenu sliku
img = double(imread([put '\' ime_dat]));

K = 3;                          % K za GMM
[n,m,d] = size(img);
podaci = reshape(img, n*m,d);   % 2D matrica


g_model = fitgmdist(podaci, K,'Options',statset('MaxIter',500),'SharedCov', true);

%% Zamijena svakog piksela s vrijednošću u središtu klastera

probb = posterior(g_model,podaci) ;
[~,max_g] = max(probb,[],2);

max_g = reshape(max_g, n,m);
img_p_2 = img;

for i = 1:n
    for j =1:m
       img_p_2(i,j,:) = g_model.mu(max_g(i,j),:);
    end
end

imwrite(uint8(img_p_2), 'segmentirana_slika_GMM.jpg');

figure('Name','GMM segmentacija','NumberTitle','off');
subplot(2, 2, 1); 
imshow(uint8(img));
title('Početna slika') 
subplot(2, 2, 2); 
imshow(uint8(img_p_2)); 
title([' K = ' num2str(K)])

end