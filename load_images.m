clear all
close all
clc

[spag1, map, spag_a] = imread("spaghetti/2.png", 'png');
spag1 = imresize(spag1, 1/7);
spag_a = imresize(spag_a, 1/7);

b1 = imread("background/b1.jpg", "jpeg");

% get histogram of background image
b1_hist = imhist(b1);
b1_r = imhist(b1(:,:,1));
b1_g = imhist(b1(:,:,2));
b1_b = imhist(b1(:,:,3));
figure
yyaxis right
plot(b1_r, 'r')
hold on
plot(b1_g, 'g')
plot(b1_b,'b')
plot(b1_hist, 'k');

yyaxis left
ylim([0 300])

hold off