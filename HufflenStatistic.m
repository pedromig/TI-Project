function [avg,var] =  HufflenStatistic(file,alpha)
    %===========================================================================================
    % Name:  HufflenStatistic
    %
    % Input arguments :
    %                    #  file -> Symbol source file(our double type source)
    %                    #  alpha -> Alphabet (optional argument) that we
    %                                that we will use to base our entropy calculation
    %
    % Description :
    % This fuction gets the source data from the source file and the alphabet of the given source 
    % and calculates the mean and variance of the number number of bits per symbol using huffman 
    % codes in that source.
    %
    % Output:
    %                   # avg -> Average of the number of bits per symbol using Huffman codes
    %                   # var -> Variance of the number of bits per symbol using Huffman codes
    %===========================================================================================

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