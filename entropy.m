function e = entropy(file,alpha)

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
   
   % Detects if alphabet was provided and builds one if its not the case 
   if(nargin < 2)
         alpha = getAlphabet(src,type,file);
   end

   src = double(src);   
   alpha = double(alpha);
   
    data = categorical(src, alpha);
    freq = histcounts(data);
    
    numero_de_amostras = size(src,1) * size(src,2);
    prob = freq / numero_de_amostras;
    
    e = -prob(prob ~= 0) * log2(prob(prob ~= 0)');
    
end