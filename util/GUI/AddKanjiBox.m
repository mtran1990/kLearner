function answer = AddKanjiBox
% function answer = AddKanjiBox
% Asks the user to type in a new kanji with phrases and readings
% Returns a kanji class variable
% Note: this will pause the execution of the program until the string of
% the edit box changes

%% initialize figure
f = figure;
clf(f);
set(f,'menu','none','toolbar','none','numbertitle','off');

xwidth = 200;
ywidth = 300;

set(f,'Visible','on','name','Add Kanji Menu',...
    'Position',[360,500,xwidth,ywidth]);

mPanel = uipanel(f,'title','Add Kanji',...
    'units','normalized','position', [0.05 0.05 0.9 0.9]);

t1 = uicontrol(mPanel,'style','text','string','Kanji:','units',...
    'normalized','position',[0.1 0.8 0.8 1/6]);

e1 = uicontrol(mPanel,'style','edit','units','normalized','position',...
    [0.1 0.7 0.8 1/6],'fontsize',14);

t2 = uicontrol(mPanel,'style','text','string',...
    'Phrases (comma separated):','units',...
    'normalized','position',[0.1 0.5 0.8 1/6]);

e2 = uicontrol(mPanel,'style','edit','units','normalized','position',...
    [0.1 0.4 0.8 1/6],'fontsize',14);

t3 = uicontrol(mPanel,'style','text','string',...
    {'Readings','(comma separated):'},'units',...
    'normalized','position',[0.1 0.2 0.8 1/6]);

e3 = uicontrol(mPanel,'style','edit','units','normalized','position',...
    [0.1 0.1 0.8 1/6],'fontsize',14);

%% find the java handles
j1 = findjobj(e1,'nomenu');
j2 = findjobj(e2,'nomenu');
j3 = findjobj(e3,'nomenu');

%% set callback functions
set(e1,'KeyPressFcn',@(h,e)eBoxCallBack(f,e,j1,j2,j3));
set(e2,'KeyPressFcn',@(h,e)eBoxCallBack(f,e,j1,j2,j3));
set(e3,'KeyPressFcn',@(h,e)eBoxCallBack(f,e,j1,j2,j3));

answer = [];

while(~isa(answer,'KanjiVar'))
    waitfor(f,'userdata');
    if(ishandle(f))        
        answer = get(f,'userdata');
    else
        break;
    end
end

if(ishandle(f))
    close(f);
end

end

function eBoxCallBack(f,eData,j1,j2,j3)

if(strcmp(eData.Key,'return'))
    
    kanji = get(j1,'Text');
    p = get(j2,'Text');
    r = get(j3,'Text');

    if(~isempty(p) && ~isempty(r))
    
        phrases = parseText(p);
        readings = parseText(r);

        l1 = length(phrases{:});
        l2 = length(readings{:});

        if(l1 ~= l2)    
            warning('Mismatch in the number of Phrases / Readings');
            kVar = 0;
        else
            kVar = KanjiVar(kanji,phrases,readings);

        end
        
        set(f,'userdata',kVar);
    
    end
end

end

function str = parseText(txt)

str = textscan(txt,'%s','delimiter',',');

end