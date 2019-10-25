function mutual = mutualInfo(query,target,alpha)

    e_query = entropy(query,alpha);
    e_target = entropy(target,alpha);
    joint_entropy = jointEntropyCalc(query,target,alpha);
    
    mutual = e_query + e_target - joint_entropy;
end


function j_entropy = jointEntropyCalc(query,target,alpha)
    freq_matrix = zeros(length(query),length(target));
    for i = 1 : length(query)
        for j = 1 : length(target)
            freq_matrix(alpha(i),alpha(j)) = freq_matrix(alpha(i),alpha(j)) + 1;            
        end 
    end

    total = sum(freq_matrix,"all");
    prob = freq_matrix / total;

    j_entropy = -sum(prob(prob ~= 0).*log2(prob(prob ~= 0)),"all");

end
