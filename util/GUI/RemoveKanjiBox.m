function answer = RemoveKanjiBox
% function answer = RemoveKanjiBox
% Asks the user to type in a Kanji to remove from the list
% Note: will pause the execution of the program until the string of the
% edit box changes

%% initialize figure
f = figure;
clf(f);
set(f,'menu','none','toolbar','none','numbertitle','off');

xwidth = 200;
ywidth = 100;

set(f,'Visible','on','name','Remove Kanji',...
    'Position',[360,500,xwidth,ywidth]);

tPanel = uipanel(f,'title','Remove which Kanji?',...
    'units','normalized','position', [0.1 0.1 0.8 0.8]);

eBox = uicontrol(tPanel,'style','edit','units','normalized','position',...
    [0.1 0.1 0.8 0.8],'fontsize',14);
jEditbox = findjobj(eBox,'nomenu');

set(eBox,'callback',@(h,e)eBoxCallBack(h,jEditbox));

% wait until edit box string changes, then use the string as the answer
waitfor(eBox,'string');

% handle the case where the figure was closed beforehand
if(ishandle(f))
    data = guidata(f);
    answer = data.inputText;

    close(f);
else
    answer = [];
end

end

function eBoxCallBack(hObject,jEditbox)

data.inputText = get(jEditbox,'Text'); 
guidata(hObject,data);

end