%% KanjiVar Class
% Consists of a single kanji, multiple phrases, and their readings
% Contains methods to create a variable with this information

classdef KanjiVar < handle
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
        
        function out = mergeKanji(obj, other)
            if(strcmp(obj.kanji,other.kanji))
                obj.phrases.characters = union(obj.phrases.characters,...
                    other.phrases.characters,'stable');
                obj.phrases.readings = union(obj.phrases.readings,...
                    other.phrases.readings,'stable');
                
                out = true;
            else
                out = false;
            end
            
        end
        
    end
    
end