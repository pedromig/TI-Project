function h = histPlot(file, alpha)
    %================================================================================
    % Name:  histPlot
    %
    % Input arguments :
    %                    #  file -> Symbol source file
    %                    #  alpha -> Alphabet (optional argument) where we will
    %                         base our frequency analysis of the source (file)
    %
    % Description :
    % This function plots a histogram of the ocurrence of each symbol in an
    % alphabet. If the alphabet is not provided the function will analyse
    % source and will build an alphabet with all the unique symbols in the
    % source file.
    % The fuction is ready to receive sources from an image file (.bmp)
    % a mono audio file (.wav) or a text file(.txt)
    %
    % Output:
    %                    # h -> Histogram type object with the frequency
    %                           representation of each symbol in the alphabet
    %================================================================================

    [src,name,type] = getSource(file);

    % Detects if alphabet was provided and builds one if its not the case
    if(nargin < 2)
        alpha = getAlphabet(src,type,file);
    end
    
    alpha = double(alpha);
    src = double(src);
    
    switch type
        case "text"
            
            chars = cell(1,size(alpha,2)); 
            for i = 1 : size(alpha,2)
                chars(1, i) = {char(alpha(1, i))};
            end
            
            data = categorical(src, alpha); 
            h = histogram(data);

            xticklabels(chars);             
        case "image"

            data = categorical(src, alpha);
            h = histogram(data);      
               
        case "audio"
            data = categorical(src,alpha);
            h = histogram(data);

        otherwise 
            h = -1;
            disp("ERROR");
    end
    
    % Adjusts Histogram properties
    histProperties(name,"Alphabet","Frequency")   
end


function histProperties(name,xLabel,yLabel)
    title(name);
    xlabel(xLabel);
    ylabel(yLabel);
end
