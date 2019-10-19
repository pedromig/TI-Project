function avg =  avgNumBits(f,alfa)
    
    if(nargin < 2)
        alfa = unique(f);
        alfa = double(alfa);
    end  
    f = double(f);
    
    temp = categorical(f, alfa);
    frequencias = histcounts(temp);
    
    bits = hufflen(frequencias);
    avg = sum(bits) / size(bits, 2);
    
end