function mutualMatrix = imgMutualInformation(query,target,step)

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