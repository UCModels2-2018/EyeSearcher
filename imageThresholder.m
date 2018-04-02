function [outputArray] = imageThresholder(inputArray)
%imageThresholder converts 1D image array to 1s and -1s
%Threshold value may be changed
inputArray = inputArray/255;
outputArray = inputArray;
for j = 1: length(inputArray)    
    if inputArray(j)>0.75
        outputArray(j)=1;
    else
        outputArray(j)=-1;
    end
end
end

