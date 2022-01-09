function [out] = matchHistogram(b_cdf, f_cdf, img)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

M = [zeros(1,256); zeros(1,256); zeros(1,256)];
for i = 1:3
    for idx = 1:256
        [~,ind] = min(abs(f_cdf(idx,i) - b_cdf(:,i)));
        M(i,idx) = ind-1;
    end
end

[h, w, d] = size(img);
out = zeros(h,w,d,'uint8');
for i = 1:h
    for j = 1:w
        for k = 1:d
            out(i,j,k) = M(k, double(img(i,j,k))+1);
        end
    end
end


end