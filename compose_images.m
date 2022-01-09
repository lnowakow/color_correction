% Auto Color Correction and Contrast Enhancement
clear all, close all

% Load images
[spag1, map, spag_a] = imread("foreground/0.png", 'png');
spag1 = imresize(spag1, 1/7);
spag_a = imresize(spag_a, 1/7);

[min, max] = boundingBox(spag_a);
spag1 = spag1(min(1):max(1),min(2):max(2),:);
spag_a = spag_a(min(1):max(1),min(2):max(2));

b1 = imread("background/b1.jpg", "jpeg");

% find dark and light tones in background
[dark, light] = getDarkLight(b1);

% color correct foreground
cc_spag1 = autoColorCorrect(spag1, dark, light);
cc_c_spag1 = imadjust(cc_spag1, [0.1 0.9], []);


figure
subplot(1,3,1)
imshow(b1);
subplot(1,3,2)
image(spag1,'AlphaData',spag_a);
pbaspect([1 1 1])
subplot(1,3,3)
image(cc_c_spag1, 'AlphaData', spag_a);
pbaspect([1 1 1])


figure
output = pasteImage(b1, cc_c_spag1, spag_a);
imshow(output);








