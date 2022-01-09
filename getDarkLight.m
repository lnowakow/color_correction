function [dark,light] = getDarkLight(img)
% getDarkLight finds the average dark colour in the image and the average
% light color in the image

img_hsv = rgb2hsv(img);
img_hsv(300:320, 300:320, 3);

[h, w, d] = size(img_hsv);
dark_count = 0;
light_count = 0;

dark = [[0 0 0]];
light = [0 0 0];

for i = 1:h
    for j = 1:w
        if img_hsv(i,j,3) < 0.20
            dark_count = dark_count + 1;
            tmp = hsv2rgb(img_hsv(i,j,:));
            dark(1) = dark(1) + tmp(:,:,1);
            dark(2) = dark(2) + tmp(:,:,2);
            dark(3) = dark(3) + tmp(:,:,3);
        elseif img_hsv(i,j,3) > 0.80
            light_count = light_count + 1;
            tmp = hsv2rgb(img_hsv(i,j,:));
            light(1) = light(1) + tmp(:,:,1);
            light(2) = light(2) + tmp(:,:,2);
            light(3) = light(3) + tmp(:,:,3);
        end
    end
end

dark = uint8((dark/dark_count)*255);
light = uint8((light/light_count)*255);

end