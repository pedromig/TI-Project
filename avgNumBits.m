function avg =  avgNumBits(file,alpha)
        
    [src,~,type] = getSource(file);
    
    if(nargin < 2)
       alpha = getAlphabet(file,type,file);
    end  
    
    alpha = double(alpha);
    src = double(src);
    
    data = categorical(src, alpha);
    frequencias = histcounts(data);
    
    bits = hufflen(frequencias);
    avg = sum(bits) / size(bits, 2);
    
end   