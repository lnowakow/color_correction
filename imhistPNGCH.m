function [hist_vals] = imhistPNGCH(image, a)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[rows, cols] = size(image(:,:,1));

hist_vals = [zeros(256,1), zeros(256,1), zeros(256,1)];

for i = 1:rows
    for j = 1:cols
        %fprintf("The value of alpha channel at (%i,%i) is: %i\n", i, j, a(i,j));
        if a(i,j) == 0
            %fprintf("Alpha is zero\n");
        else 
            %fprintf("Alpha is non-zero\n")
            for k = 1:3
                p = double(image(i,j,k)) + 1;
                hist_vals(p,k) = hist_vals(p,k) + 1;
            end
        end
    end
end

x = linspace(0,255, 256);
plot(x, hist_vals(:,1)', "Red", x, hist_vals(:,2)', "Green", x, hist_vals(:,3)', "Blue");


end