function [var] = varMutualInfo(mutualInfo)

    %Number of samples
    n_samples= (size(mutualInfo,1) * size(mutualInfo,2)); 

    %Frequency calculation
    alfa = unique(mutualInfo);
    temp = [1 : size(alfa,1) + 1];
    temp(1 : end - 1) = alfa(:);
    temp(end) = temp(end - 1) + 1;
    frequencias = histcounts(mutualInfo, temp);

    %Probabilities Calculation
    probabilities = frequencias / n_samples;

    esperanca_x = 0;
    esperanca_x2 = 0;

    for i = 1 : size(frequencias,2)
        temp1 = probabilities(1, i) * alfa(i,1); 
        temp2 = probabilities(1, i) * power(alfa(i, 1),2);
        esperanca_x = esperanca_x + temp1;
        esperanca_x2 = esperanca_x2 + temp2;
    end

    var = esperanca_x2 - power(esperanca_x, 2);

end