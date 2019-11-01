function [m,l,c] = maxMutualInfo(mutualMatrix,step)
  %===========================================================================================
  % Name:  maxMutualInfo
  %
  % Input arguments :
  %                    #  mutualMatrix -> The matrix containing the mutual information obtained 
  %                                       from the confrontation of the window slicing of the 
  %                                        source and the query.
  %                    #  step -> The step that we took when slicing the source to get 
  %                               the multiple mutual informations given a certain window.
  % Description :
  % This fuction gets the mutualInfo matrix and return the maximum value for that matrix
  % and the coordinates of the top right corner of the window where we got that information.
  % The coordinates  represent the placement of the rectangle. 
  %
  % Output:
  %                   # m -> Maximum mutual inforation obtain from the window and the query.
  %===========================================================================================

    m = mutualMatrix(1,1);
    l = 1;
    c = 1;
    
    for i = 1: size(mutualMatrix,1)
        for j = 1 : size(mutualMatrix,2)
            if (m < mutualMatrix(i,j))
                  m = mutualMatrix(i,j);
                  c = 1 + (i-1)*step;
                  l = 1 + (j-1)*step;
            end
        end
    end
    
end