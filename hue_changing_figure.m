%% Update Color
% HSV colour matching
amount = 0;
spag1 = imtweak(spag1, 'hsv', [amount 1 1]);
f = figure(3);
ax = axes('Parent',f,'Position',[0.2 0.2 0.6 0.7]);
i = image(spag1, 'AlphaData',spag_a);
b = uicontrol('Parent', f, 'Style','slider', 'Position',[100 50 450 20],...
    'Value',amount, 'Min',0, 'Max',1);
bgcolor = f.Color;
bl1 = uicontrol('Parent',f,'Style','text','Position',[70,50,23,20],...
                'String','0','BackgroundColor',bgcolor);
bl2 = uicontrol('Parent',f,'Style','text','Position',[550,50,23,20],...
                'String','1','BackgroundColor',bgcolor);
bl3 = uicontrol('Parent',f,'Style','text','Position',[275,25,100,23],...
                'String','Hue Change','BackgroundColor',bgcolor);
b.Callback = @(es, ed) image(imtweak(spag1, 'hsv', [es.Value 1 1]), 'AlphaData', spag_a);
