function [min, max] = boundingBox(map)
% boundingBox function outputs the 2 points defining the range of indeces
% that contain the image

[h, w] = size(map);

min = [h w];
max = [1 1];

for i = 1:h
    for j = 1:w
        if map(i,j) ~= 0
            if i < min(1)
                min(1) = i;
            end
            if j < min(2)
                min(2) = j;
            end
            if i > max(1)
                max(1) = i;
            end
            if j > max(2)
                max(2) = j;
            end
        end
    end
end

end