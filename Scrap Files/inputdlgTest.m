% inputdlg box text
% trying to get it to work with Japanese characters

function inputdlgTest()

f = figure(1);
clf(f);
set(f,'menu','none','toolbar','none','numbertitle','off');
%% initialize figure
xwidth = 600;
ywidth = 400;

set(f,'Visible','on','Position',[360,500,xwidth,ywidth]);

eBox = uicontrol(f,'style','edit','units','normalized','position',...
    [0.1 0.1 0.8 0.1]);
jEditbox = findjobj(eBox,'nomenu');

set(eBox,'callback',@(h,e)eBoxCallBack(h,jEditbox));


end

function eBoxCallBack(hObject,jEditbox)


text = get(jEditbox,'Text'); 

end