function [hist_vals] = imhistCH(image)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Split image into RGB channels
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

% Get hist for each channel
[yR, x] = imhist(R);
[yG, x] = imhist(G);
[yB, x] = imhist(B);

hist_vals = [yR, yG, yB];

plot(x, yR, "Red", x, yG, "Green", x, yB, "Blue");

end