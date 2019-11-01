function [newSource,alpha] = createGroupings(src,type,grouping)
    %===========================================================================================
    % Name:  createGroupings
    %
    % Input arguments :
    %                    #  src -> The source of information
    %                    #  alpha -> The type of the file where we extracted the 
    %                                the source
    %                    #  grouping -> The grouping that we want to apply to the source
    %                                   (group elements by 2,3,...)
    % Description :
    % This fuction gets the source and the type of that source and performs certain operations
    % so we can group it correctly. The groups are made using bitwise shift left operations
    % that allow us to represent uniquely each and every group we make.The groups are obtained
    % doing these operations between each element of source and the followingf one until
    % we reach the end of the source matrix.
    %
    % Output:
    %                   # newSource -> The new Source with numbers corresponding to the grouped
    %                                 elements of the original source( they wont make much sense)
    %                   $ newAlphabet -> A unique alphabet obtained from the newSource.
    %===========================================================================================

    if (type == "text" )
		src = src( src <= 'Z' & src >='A' | src <= 'z' & src >= 'a'| src <= '9' & src >= '0');
		src = double(src); 
    elseif (type == "image")
        
        if ( mod(size(src,2),2) ~= 0)
            
            src = src(:,1:end-1);
            src = reshape(src',1,[]);
        end
    end

    odd_pos = src(1:grouping:end-1);
    even_pos = src(2:grouping:end);

    newSource = double(odd_pos * pow2(8) + even_pos);
    alpha = unique(newSource);

end
