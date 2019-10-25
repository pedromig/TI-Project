function h = histPlot(file,alpha,varargin)
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
    grouping = 1;

    if (nargin <= 2)

        if (nargin == 1 || alpha == "group")
            alpha = getAlphabet(src,type,file);
        end

	    alpha = double(alpha);
	    src = double(src);
           
    else

        grouping = cell2mat(varargin(1));
        src = double(src);

    	[src,alpha] = createGroupings(src,type,grouping);
        
    end

    switch type
        case "text"
            chars = getTextCharLabels(alpha,grouping);   

            data = categorical(src,alpha);
            h = histogram(data);

            xticklabels(chars); 
            xtickangle(0);
         
        case "image"
       
            data = categorical(src,alpha);
            h = histogram(data);
           if ( length(alpha) ~= 2 && length(alpha) ~= 4)
                xticks(categorical(alpha(1: 50: length(alpha))));
           elseif ( grouping == 2)
                xticklabels('auto');
           else
                    %xticks(categorical(getCharLabelsMRIBin(alpha);
           end
            
         case "audio"
            data = categorical(src,alpha);
            h = histogram(data);
            
            if ( grouping == 2)
                xticks('auto');
                xticklabels('auto');
            else
                xticks(categorical(alpha(1: 5 : length(alpha))));
            end
            
        otherwise
               h = -1;
               disp("Error");
    end


    histProperties(name,"Alphabet","Frequency")   
end


function histProperties(name,xLabel,yLabel)
    title(name);
    xlabel(xLabel);
    ylabel(yLabel);
end

function chars = getTextCharLabels(alpha,grouping)

    if (grouping == 1)
        chars = cell(1,size(alpha,2)); 
        for i = 1 : size(alpha,2)
            chars(1, i) = {char(alpha(1, i))};
        end
    else
        chars = strings(1, size(alpha,2));
         for i = 1 : size(alpha, 2)
                chars(1, i) = strcat( char(bitsrl(fi(bitand(alpha(1, i), 65280)), 8)), char(bitand(alpha(1, i), 255)));
         end
    end
end

function chars = getCharLabelsMRIBin(alpha)
        chars = strings(1, size(alpha,2));
         for i = 1 : size(alpha, 2)
                chars(1, i) = strcat( char(bitsrl(bitand(alpha(1, i), 65280)),1), char(bitand(alpha(1, i), 255)));
         end
end
