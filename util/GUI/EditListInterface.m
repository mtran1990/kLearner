%% Edit List Interface
% Shows user current lists (txt files) of Kanji
% Options to create new lists, edit old ones
% Editting:
% Let the user add / remove phrases, add / remove Kanji

function f = EditListInterface(figNum, fileDir)

f = figure(figNum);
clf(f);
set(f,'menu','none','toolbar','none','name','Select / Edit a File',...
    'numbertitle','off');
%% initialize figure
xwidth = 600;
ywidth = 400;

set(f,'Visible','on','Position',[360,500,xwidth,ywidth]);

%% get information on the files
listings = dir(fileDir);
fileNames = {listings(3:end).name};

%% create panel for current lists
p = uipanel(f,'title','Current Files','units','normalized',...
    'position',[0.05 0.5 0.3 0.45]);

% create current lists
nameListBox = uicontrol(p,'style','listbox','string',fileNames,...
    'units','normalized','position',[0.1 0.1 0.8 0.85]);

%% create panel for contents of txt files
p2 = uipanel(f,'title','File Contents','units','normalized',...
    'position',[0.4 0.05 0.55 0.9]);

fileTextBox = uicontrol(p2,'style','listbox',...
    'units','normalized','position',[0.1 0.1 0.8 0.85],...
    'horizontalalignment','left');

%% create panel for options
p3 = uipanel(f,'title','Options','units','normalized',...
    'position',[0.05 0.05 0.3 0.4]);

% create buttons
b1 = uicontrol(p3,'style','pushbutton','string','Select',...
    'units','normalized','position',[0.1 0.75 0.8 0.2]);

b2 = uicontrol(p3,'style','pushbutton','string','Add',...
    'units','normalized','position',[0.1 0.55 0.8 0.2]);

b3 = uicontrol(p3,'style','pushbutton','string','Remove',...
    'units','normalized','position',[0.1 0.35 0.8 0.2]);

%% set callback functions
listBoxCallback = @(h,e)displayFileContents(h,e,fileTextBox,fileDir);
set(nameListBox,'callback',listBoxCallback);

listBoxCallback(nameListBox,0);

removeButton = @(h,e)removeKanji(h,e,nameListBox,fileDir);
set(b3,'callback',removeButton);

%% initialize userdata
% data.inputText = [];
data.dispFile = @()listBoxCallback(nameListBox,[]);
guidata(f,data);

end

function removeKanji(hObject,~,nameListBox,fileDir)

% create a dialog box to ask which kanji to remove, wait until it's closed
[answer] = RemoveKanjiBox;
% uiwait(f);

if(~isempty(answer))
    
    items = get(nameListBox,'String');
    index = get(nameListBox,'Value');
    fPath = fullfile(fileDir,items{index});
    
    % read in all the kanji in the file
    [tLine, kList] = textReader(fPath);
    
    % find the matching kanji
    kanji = {kList.kanji};
    matches = strcmp(answer,kanji);        
    
    % remove the kanji
    kList = kList(~matches);
    
    % warn if no kanji removed
    if(sum(matches)==0)
        warning('Kanji: %s not found',answer);
        
    % else, overwrite old file with new list
    else
        textPrinter(tLine,kList,fPath);
    end    
    
    data = guidata(hObject);
    data.dispFile();
    
end


end

function displayFileContents(hObject,~,tBoxHandle,fileDir)

items = get(hObject,'String');
index = get(hObject,'Value');
fPath = fullfile(fileDir,items{index});

str = getText(fPath);

set(tBoxHandle,'string',str);

end

function str = getText(fPath)

fid = fopen(fPath,'r','n','Shift_JIS');
str = textscan(fid, '%s', 'Delimiter','\n','whitespace','');
str = str{1};

% str = fscanf(fid,'%c');

fclose(fid);

end