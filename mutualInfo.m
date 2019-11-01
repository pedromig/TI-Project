function mutual = mutualInfo(query,target)
    %===========================================================================================
    % Name: mutualInfo
    %
    % Input arguments :
    %                    #  query -> The matrix of the sources 
    %                    #  target -> The matrix of the window (target)  
    % Description :
    % This fuction calculates the mutual information between the query and the target.
    % To do that it calculates que entropies of the query  the target and the joint entropy
    %  between both the source and the target.
    %
    % The formula for the mutual information calculation that helps us the most in our computation
    % is the following:
    %                       I(query;target) = H(query) + H(target) - H(query,target)
    %
    % Output:
    %                    # mutual -> mutual inforation obtained from the source and the target.
    %===========================================================================================
    
    e_query = entropy(query);
    e_target = entropy(target);
    joint_entropy = jointEntropyCalc(query,target);
    
    mutual = e_query + e_target - joint_entropy;

end


function j_entropy = jointEntropyCalc(query,target)
    %===========================================================================================
    % Name: jointEntropyCalc
    %
    % Input arguments :
    %                    #  query -> The matrix of the sources 
    %                    #  target -> The matrix of the window (target)  
    % Description :
    % This fuction calculates the joint entropy between two sources.
    %
    % Output:
    %                   # j_entropy -> The numeric value for the joint entropy between
    %                                  the query and the target.
    %===========================================================================================


    query = double(reshape(query',1,[]));
    target = double(reshape(target',1,[]));
    
    newSource = double((target * pow2(8) + query));
    alpha = unique(newSource);
    alpha = [alpha alpha(end)+1];
      
    freq = histcounts(newSource,alpha);
   
    prob = freq/sum(freq);
    j_entropy =  sum(-prob(prob ~= 0).*log2(prob(prob ~= 0)));

end
