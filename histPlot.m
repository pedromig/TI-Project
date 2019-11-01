function h = histPlot(file,alpha,varargin)
    %================================================================================
    % Name:  histPlot
    %
    % Input arguments :
    %                    #  file -> Symbol source file
    %                    #  alpha -> Alphabet (optional argument) where we will
    %                         base our frequency analysis of the source (file)
    %                         if we pass the keyword positional argument
    %                         "group" we will have to specify a optional argument
    %                          described bellow. 
    %                    # varargin -> the grouping rule.If the alpha argument gets
    %                                   the keyword "group" we have to specify the
    %                                   how the groups in the source will be made 
    %                                   (groups of 2 3,...)
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

        % Builds new Alphabet if one was not given
        if (nargin == 1 || alpha == "group")
            alpha = getAlphabet(src,type,file);
        end

        % Cast to double to avoid problems 
	    alpha = double(alpha);
	    src = double(src);
           
    else
        
        
        grouping = cell2mat(varargin(1));
        src = double(src);

        %Gets the source and the alphabet grouped
    	[src,alpha] = createGroupings(src,type,grouping);
        
    end


    % Plot section
    switch type
        
        % Plots lyrics.txt
        case "text"

            chars = getTextCharLabels(alpha,grouping);   

            data = categorical(src,alpha);
            h = histogram(data);

            % Histogram xAxis look
            xticklabels(chars); 
            if ( grouping == 2)
                xtickangle(90);
            else
                xtickangle(0);
            end
         
        % Plots landscape.bmp MRI.bmp and MRIBin.bmp
        case "image"
       
            data = categorical(src,alpha);
            h = histogram(data);

            % Histogram xAxis look
            if ( length(alpha) ~= 2 && length(alpha) ~= 4)
                xticks(categorical(alpha(1: 50: length(alpha))));
            else
                xticklabels('auto');
            end
            

        %Plots soundMono.wav
         case "audio"
            data = categorical(src,alpha);
            h = histogram(data);
            
            % Histogram xAxis look
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
    %================================================================================
    % Name:  histProperties
    %
    % Input arguments :
    %                    #  name -> The title of the histogram
    %                    #  xLabel -> The name of the Xlabel
    %                    #  yLabel -> The name of the Ylabel
    %
    % Description :
    % This function sets the histogram title xLabel and Ylabel.
    % Output: (void)
    %================================================================================

    title(name);
    xlabel(xLabel);
    ylabel(yLabel);
end

function chars = getTextCharLabels(alpha,grouping)
    %================================================================================
    % Name:  getTextCharLabels
    %
    % Input arguments :
    %                    #  alpha -> The alphabet obtained from the source
    %                    #  grouping -> The grouping that we are going to perform 
    %
    % Description :
    % This function gets the alphabet in ascii format and returns a array of strings
    % that correspond to the labels in the histogram associated with those ascii 
    % characters
    % Output: 
    %                    #  chars -> The char labels of the ascii alphabet
    %================================================================================


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