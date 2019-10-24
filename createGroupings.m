function [newSource,alpha] = createGroupings(src,type,grouping)

	if (type == "text" || type == "audio")
		src = src( src <= 'Z' & src >='A' | src <= 'z' & src >= 'a'| src <= '9' & src >= '0');
		src = double(src);
        
        odd_pos = src(1:grouping:end-1);
        even_pos = src(2:grouping:end);
    else
        src = double(src);
        odd_pos = double();
        even_pos= double();
        
        o = 1;
        e = 1;
        
        for  i  = 0 : size(src,1)
            for j = 0 : size(src,2)
                if( mod(i+j,2) == 0)
                    odd_pos(1,o) = src(i,j);
                    o = o+1;
                else
                    even_pos(1,e) = src(i,j);
                    e = e+1;
                end
            end
        end
        
	end

newSource = double(odd_pos * pow2(8) + even_pos);
alpha = unique(newSource);

end
