%% Kanji Reading Test Code

%% Read scrap.txt
fid = fopen('scrap.txt', 'r', 'n', 'Shift_JIS');
str = fread(fid, '*char')';
fclose(fid);
disp(str);

%% Display str in figures
uicontrol('Style','text', 'String',str, ...
    'Units','normalized', 'Position',[0 0 1 1], ...
    'FontName','Arial Unicode MS')