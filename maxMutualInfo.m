function [m,l,c] = maxMutualInfo(mutualMatrix,step)
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