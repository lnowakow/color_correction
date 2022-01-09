% Original Images
figure(1)
subplot(3,2,1)
imshow(b1)
title("background image 1")
subplot(3,2,2)
image(spag1, 'AlphaData', spag_a)
pbaspect([1 1 1])
title("spaghetti 1")

% RGB CDFs
subplot(3,2,3)
cdf_b1 = cumdf(b1_hist);
x = linspace(0,255,256);
plot(x, cdf_b1(:,1), "Red", x, cdf_b1(:,2), "Green", x, cdf_b1(:,3), "Blue")
title("Background CDF")
subplot(3,2,4)
cdf_spag1 = cumdf(spag1_hist);
plot(x, cdf_spag1(:,1), "Red", x, cdf_spag1(:,2), "Green", x, cdf_spag1(:,3), "Blue")
title("Spaghetti CDF")

% Foreground CDF matched to background CDF
subplot(3,2,5)
mapped_spag1 = matchHistogram(cdf_b1, cdf_spag1, spag1);
imhistPNGCH(mapped_spag1, spag_a);
title("New histogram")
%image(mapped_spag1, 'AlphaData', spag_a);
%pbaspect([1 1 1])
title("Matched histogram")
subplot(3,2,6)
mapped_spag1_cdf = cumdf(imhistPNGCH(mapped_spag1, spag_a));
plot(x, mapped_spag1_cdf(:,1), "Red", x, mapped_spag1_cdf(:,2), "Green", x, mapped_spag1_cdf(:,3), "Blue")
title("mapped spaghetti histogram")