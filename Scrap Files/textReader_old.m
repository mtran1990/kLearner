%% List Reader

%% Startup
DIR1 = './Text Files';
DIR2 = genpath('./util');
addpath(DIR1,DIR2);

fName = 'Lesson3List.txt';

%% Read File
fid = fopen(fName,'r','n','Shift_JIS');
fgetl(fid); % Ignore First line

kanjiList  = KanjiVar.empty;
kanjiCount = 0;

% don't forget to include the newline in fscanf
[kanji,readFields] = fscanf(fid,'Kanji: %s\n');
while(readFields>0)
    
    kanjiCount = kanjiCount + 1;
    
    fgetl(fid); % Ignore "Phrases" line
    A = textscan(fid,'+%s %s','delimiter',':');
    
    kanjiList(kanjiCount) = KanjiVar(kanji,A{:,1},A{:,2});
    
    [kanji,readFields] = fscanf(fid,'Kanji: %s\n');
end
fclose(fid);

%% Cleanup
rmpath(DIR1,DIR2);