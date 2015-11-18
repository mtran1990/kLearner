function f = RemoveKanjiBox(parent)

f = figure;
clf(f);
set(f,'menu','none','toolbar','none','numbertitle','off');
%% initialize figure
xwidth = 200;
ywidth = 100;

set(f,'Visible','on','name','Remove Kanji',...
    'Position',[360,500,xwidth,ywidth]);

tPanel = uipanel(f,'title','Remove which Kanji?',...
    'units','normalized','position', [0.1 0.1 0.8 0.8]);

eBox = uicontrol(tPanel,'style','edit','units','normalized','position',...
    [0.1 0.1 0.8 0.8],'fontsize',14);
jEditbox = findjobj(eBox,'nomenu');

set(eBox,'callback',@(h,e)eBoxCallBack(f,jEditbox,parent));

end

function eBoxCallBack(f,jEditbox,parent)

data = guidata(parent);
data.inputText = get(jEditbox,'Text'); 
guidata(parent,data);
close(f);

end