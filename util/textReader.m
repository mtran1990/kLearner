%% List Reader

function [tLine, kList] = textReader(fName)
%% Read File
fid = fopen(fName,'r','n','Shift_JIS');
tLine = fgetl(fid); % Get title line

kList  = KanjiVar.empty;
kanjiCount = 0;

% don't forget to include the newline in fscanf
[kanji,readFields] = fscanf(fid,'Kanji: %s\n');
while(readFields>0)
    
    kanjiCount = kanjiCount + 1;
    
    fgetl(fid); % Ignore "Phrases" line
    A = textscan(fid,'+%s %s','delimiter',':');
    
    kList(kanjiCount) = KanjiVar(kanji,A{:,1},A{:,2});
    
    [kanji,readFields] = fscanf(fid,'Kanji: %s\n');
end
fclose(fid);
end