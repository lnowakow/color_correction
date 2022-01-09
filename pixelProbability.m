function [new_hists] = pixelProbability(hist_vals)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

sum = 0;
[num_pixel, ] = size(hist_vals);

for i = 1:num_pixel
    sum = sum + hist_vals(i,1);
end

new_hists = hist_vals/sum;

x = linspace(0,255, 256);
plot(x, new_hists(:,1)', "Red", x, new_hists(:,2)', "Green", x, new_hists(:,3)', "Blue");

end