function [src,name,type] = getSource(file)
    %===========================================================================================
    % Name:  getSource
    %
    % Input arguments :
    %                   # file -> Symbol source file
    %
    % Description :
    % This fuction gets the source data from the source file.
    % The fuction is ready to receive sources from an image file (.bmp)
    % a mono audio file (.wav) or a text file(.txt) 
    %
    % Output:
    %                   # src -> The source data that was obtain from the file
    %                            as  matrix of a certain type
    %                   # name -> The source name (file name)
    %                   # type -> The type of the matrix obtained from the source
    %                                        >>> TYPE TABLE <<<
    %                         »» text ==> source obtained from ".txt" file (char matrix)
    %                         »» image ==> source obtained from ".bmp" file (uint8 matrix) 
    %                         »» audio ==> source obtained from ".txt" file (double matrix)
    %
    %===========================================================================================

    [~,name,extension] = fileparts(file);
    switch extension
        case '.txt'
            src = fileread(file);
            type = "text";
        case '.bmp'
            src =  imread(file);
            type = "image";
        case '.wav'
            src = audioread(file);
            type = "audio";
        otherwise
            src = 0;
            type = "error";
    end   
end
