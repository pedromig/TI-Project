function [avg,var] =  HufflenStatistic(file,alpha)
        
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
    avg_squared =  (Hlen.^2) * prob';
    var = (avg_squared - avg^2);

end   