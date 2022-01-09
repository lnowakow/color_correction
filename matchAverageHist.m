function [new_hist] = matchAverageHist(b_hist, f_hist, img)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
x = linspace(0, 255, 256);

% find the average hist level for each channel
% background
b_avg = [0,0,0];
for i = 1:3
    b_avg(i) = sum(x .* b_hist(:,i)') / sum(b_hist(:,i));
end
% foreground
f_avg = [0,0,0];
for i = 1:3
    f_avg(i) = sum(x .* f_hist(:,i)') / sum(f_hist(:,i));
end

b_avg
f_avg


end