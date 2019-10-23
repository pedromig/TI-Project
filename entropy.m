function e = entropy(file,alpha,varargin)

  %===========================================================================================
  % Name:  entropy
  %
  % Input arguments :
  %                    #  file -> Symbol source file
  %                    #  alpha -> Alphabet (optional argument) that we
  %                                that we will use to base our entropy calculation
  % Description :
  % This fuction gets the source data from the source file and calculates the entropy
  % of that source with respect to a given alphabet.If the alphabet is not provided the function
  % will build one
  %
  % Output:
  %                   # e -> The numeric value for the entropy of the source
  %===========================================================================================

   [src,~,type] = getSource(file);
    grouping = 1;
    if (nargin <= 2)
        
      if (nargin == 1 || alpha == "group")
            alpha = getAlphabet(src,type,file);
      end
      src = double(src); 
      alpha = double(alpha);
           
     else
        grouping = cell2mat(varargin(1));
        src = double(src);
    	 [src,alpha] = createGroupings(src,type,grouping);    
    end

    data = categorical(src, alpha);
    freq = histcounts(data);

    prob = freq / sum(freq);

    e = (-prob(prob ~= 0) * log2(prob(prob ~= 0)')) / grouping;
    
end