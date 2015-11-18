%% KanjiVar Class
% Consists of a single kanji, multiple phrases, and their readings
% Contains methods to create a variable with this information

classdef KanjiVar
    properties
        kanji
        phrases                
    end
    
    methods
        function k = KanjiVar(kanji,charCell,readingCell)
            
            k.kanji = kanji;
            k.phrases.characters = charCell;
            k.phrases.readings = readingCell;            
            
        end
        
        
    end
    
end