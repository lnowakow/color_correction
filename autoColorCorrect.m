function [out] = autoColorCorrect(img, dark, light)
% autoColorCorrect increase contrast of image while minimzing clipping
% according to previously defined dark and light colours
img_hist = [imhist(img(:,:,1)); imhist(img(:,:,2)); imhist(img(:,:,3))];

M = [zeros(1,256); zeros(1,256); zeros(1,256)];

for k = 1:3
    coeffs = polyfit([double(dark(k)) double(light(k))], [0 255], 1);
    for idx = 1:256
        if idx*coeffs(1)+coeffs(2) < 0
            M(k, idx) = 0;
        elseif idx*coeffs(1)+coeffs(2) > 255
            M(k, idx) = 255;
        else
            M(k, idx) = round(idx*coeffs(1)+coeffs(2));
        end
    end
end

[h, w, d] = size(img);
out = zeros(h, w, d, 'uint8');
for i = 1:h
    for j = 1:w
        for k = 1:d
            out(i,j,k) = M(k, double(img(i,j,k))+1);
        end
    end
end

end