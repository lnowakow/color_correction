function [out_hist] = cumdf(in_hist)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
out_hist = zeros(size(in_hist));
for i = 1:3
    out_hist(:,i) = cumsum(in_hist(:,i)) / sum(in_hist(:,i));
end

end