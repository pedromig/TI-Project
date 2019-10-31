function [newSource,alpha] = createGroupings(src,type,grouping)

	if (type == "text" )
		src = src( src <= 'Z' & src >='A' | src <= 'z' & src >= 'a'| src <= '9' & src >= '0');
		src = double(src); 
    elseif (type == "image")
        
        if ( mod(size(src,2),2) ~= 0)
            
            src = src(:,1:end-1);
            src = src(:)';
        end
    end
        odd_pos = src(1:grouping:end-1);
        even_pos = src(2:grouping:end);

        newSource = double(odd_pos * pow2(8) + even_pos);
        alpha = unique(newSource);

end
