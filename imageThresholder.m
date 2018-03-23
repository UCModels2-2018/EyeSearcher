function [outputArray] = imageThresholder(inputArray)
%imageThresholder converts 1D image array to 1s and -1s
%Threshold value may be changed
inputArray = inputArray/255;
outputArray = inputArray;
for j = 1: length(inputArray)    
    if inputArray(1i)>0.75
        outputArray(li)=1;
    else
        outputArray(li)=-1;
    end
end
end

