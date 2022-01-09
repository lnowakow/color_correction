% Original Images
figure(1)
subplot(2,2,1)
imshow(b1)
title("background image 1")
subplot(2,2,2)
image(spag1, 'AlphaData', spag_a)
pbaspect([1 1 1])
title("spaghetti 1")

% RGB Histograms
subplot(2,2,3)
b1_hist = imhistCH(b1);
title("backgroun histogram")
subplot(2,2,4)
spag1_hist = imhistPNGCH(spag1, spag_a);
title("spaghetti histogram")