function avg =  avgNumBits(file,alpha)
        
    [src,~,type] = getSource(file);
    
    if(nargin < 2)
       alpha = getAlphabet(src,type,file);
    end  
    alpha = double(alpha);
    src = double(src);
    
    data = categorical(src, alpha);
    freq = histcounts(data);
    
    prob = freq / sum(freq);
    Hlen = hufflen(freq);
    
    avg = Hlen * prob';
end   