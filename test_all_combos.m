% Test all images
clear all, close all

% Read in all background images

backgrounds = fileDatastore('background/*.jpg', 'ReadFcn', @importdata);
bgFileNames = backgrounds.Files;
numBGFiles = length(bgFileNames);

foregrounds = fileDatastore('foreground/*.png', 'ReadFcn', @importdata);
fgFileNames = foregrounds.Files;
numFGFiles = length(fgFileNames);

% subplot iterator
image_to_plot = 1;

for i = 1:numBGFiles
    bg = imread(bgFileNames{i}, 'jpeg');
    [h w ~] = size(bg);
    % find dark and light tones in background
    [dark, light] = getDarkLight(bg);

    for j = 1:numFGFiles
        [fg, ~, alpha] = imread(fgFileNames{j}, 'png');
        fg = imresize(fg, 1/7);
        alpha = imresize(alpha, 1/7);

        % crop around foreground
        [min, max] = boundingBox(alpha);
        fg = fg(min(1):max(1),min(2):max(2),:);
        alpha = alpha(min(1):max(1),min(2):max(2));
        
        % color correct foreground
        cc_fg = autoColorCorrect(fg, dark, light);
        cc_c_fg = imadjust(cc_fg, [0.1 0.9], []);

        % paste fg onto bg
        output = pasteImage(bg, cc_c_fg, alpha);
        %subplot(numBGFiles, numFGFiles, image_to_plot)
        figure
        axes('Units','normalized', 'Position',[0 0 1 1])
        image(output)
        pbaspect([w h 1])
        image_to_plot = image_to_plot+1;
    end
end
