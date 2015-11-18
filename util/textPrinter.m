%% Text Printer
% reverse of List Reader
% takes in a list of KanjiVars, a filename, and a title string and creates
% a text file with those attributes

function textPrinter(tLine, kList, fName)

fid = fopen(fName,'w','n','Shift_JIS');
fprintf(fid,'%s\r\n',tLine);
for i = kList
    fprintf(fid,'Kanji: %s\r\n',i.kanji);
        
    characters = i.phrases.characters;
    readings = i.phrases.readings;
    
    phraseCount = length(characters);
    
    for j = 1:phraseCount

        fprintf(fid,'+%s:\t%s\r\n',characters{j},readings{j});
        
    end
    
    fprintf(fid,'\r\n');
end

fclose(fid);

end