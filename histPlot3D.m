function histPlot3D(file,alpha)
    %================================================================================
    % Name:  histPlot3D
    %
    % Input arguments :
    %                    #  file -> Symbol source file
    %                    #  alpha -> Alphabet (optional argument) where we will
    %                         base our frequency analysis of the source (file)
    %
    % Description :
    % This function plots a 3D bar chart of the ocurrence of each symbol in a
    % grouped alphabet. If the alphabet is not provided the function will analyse
    % source and will build an alphabet with all the unique symbols in the
    % source file.
    % The fuction is ready to receive sources from an image file (.bmp)
    % a mono audio file (.wav) or a text file(.txt)
    %
    % Output: (void)
    %================================================================================

    [src,~,type] = getSource(file);
    src = double(src);
   
    if (nargin == 1)
         alpha = getAlphabet(src,type,file);
    end
    
    matrix = zeros(length(alpha));
    
    switch type
        case "image"
            
                if ( mod(size(src,2),2) ~= 0)
                    src = src(:,1:end-1);
                end
                src = reshape(src',1,[]);

            case "audio"

    end
        
    odd_pos = src(1:2:end-1);
    even_pos = src(2:2:end);

    newSource = double(odd_pos * pow2(8) + even_pos);
    newAlpha = unique(newSource);
    newAlpha = [ newAlpha newAlpha(end)+1];
    
    freq = histcounts(newSource,newAlpha);
    
    for i = 1: length(freq)
        x = uint8(bitsrl(fi(bitand(newAlpha(1, i), 65280)), 8) + uint8(1));
        y = bitand(newAlpha(1, i), 255)+1;
        matrix(x,y) = freq(i);
    end
    
   bar3(matrix); 
   
   if( type == "text")
        chars = cell(1,size(alpha,2)); 
        for i = 1 : size(alpha,2)
            chars(1, i) = {char(alpha(1, i))};
        end
         xticklabels(chars);
         yticklabels(chars);
   end
end