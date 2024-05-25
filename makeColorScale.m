function [colorvals] = makeColorScale(XX, interval)
%makeColorScale takes vector, number of categories returns x by 3 array 
%   Detailed explanation goes here
    colorvals = zeros(length(XX), 3);
    for i = 1:length(XX)
        colorvals(i, :) = [1, 1, 1];
        for cat = 1:length(interval)
            if (XX(i) >= interval(cat))
                %in category
                colorvals(i, :) = [1, (length(interval)-cat+1)/length(interval), (length(interval)-cat+1)/length(interval)];
            end
        end
    end
end
