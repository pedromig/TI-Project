function mutual = mutualInfo(query,target)
    
    e_query = entropy(query);
    e_target = entropy(target);
    joint_entropy = jointEntropyCalc(query,target);
    
    mutual = e_query + e_target - joint_entropy;
end


function j_entropy = jointEntropyCalc(query,target)

    query = double(reshape(query',1,[]));
    target = double(reshape(target',1,[]));
    
    newSource = double((target * pow2(8) + query));
    alpha = unique(newSource);
      
    data = categorical(newSource,alpha);
    freq = histcounts(data);
   
    prob = freq/sum(freq);
    j_entropy =  sum(-prob(prob ~= 0).*log2(prob(prob ~= 0)));

end
