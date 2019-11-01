function mutualMatrix = imgMutualInformation(query,target,step)
    %===========================================================================================
    % Name: imgMutualInformation
    %
    % Input arguments :
    %                    #  query -> The matrix of the source that we will try to find in 
    %                                the target 
    %                    #  target -> The matrix of the target that we will slice and so 
    %                                 we can compare against the query and hopefully
    %                                 find some relationship between the two
    %                    #  step -> The number of columns and rows that we need to walk
    %                               so w can take the next sample(window)
    % 
    % Description :
    % This fuction gets the mutualInfo matrix that corresponds to the calculation of the 
    % mutual information between our query and multiple slices of the target(windows) that
    % are sampled with respect to a given step.
    %
    % Output:
    %                   # mutualMatrix -> Matrix Containing the mutual information of all the
    %                                     slices that we got from the target.
    %===========================================================================================

    max_l = floor((size(target,1)-size(query,1)) / step) +1;
    max_c = double(floor((size(target,2)-size(query,2)) / step) +1);
    mutualMatrix = zeros(max_l,max_c);
    
    i = 1;
    w = 1;
 
    for x = size(query,1) : step : size(target,1)
        j = 1;
        k = 1;
        for y = size(query,2) : step : size(target,2)
            window = target(i : x,j : y);
        	mutualMatrix(w,k) = mutualInfo(query,window);
        	j = j + step;
        	k = k + 1;
        end 
        i = i + step;
        w = w + 1;
    end	
     
end