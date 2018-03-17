function winner = faceneuralnetwork(testImage)
%load('weightMatrix');
%load('Matrix Images');
% actual comparison
%May want to run twice for both eyes
inputImage = testImage(:)';
numPatterns = size(rawImages,1);
compare=inputImage*weights;

%Flattens the compare array for comparison
compare = compare';
compare = compare/255;
for i=1:length(compare)
    if compare(i)>0.75
        compare(i)=1;
    else
        compare(i)=-1;
    end
end

%Compares the compare array to the original flattened images
scoreVal= zeros(numPatterns,1);
for j = 1: numPatterns
    for k = 1: length(inputImage)
        if(compare(k) == rawImages(j,k))
            scoreVal(j) = scoreVal(j) + 1;
        end
    end
end

%both numbers dependant on num of pics
i=size(rawImages,1)-1;
winner=size(rawImages,1);
while i>0  
    if scoreVal(i)>=scoreVal(winner)
        winner=i;
    end
    i=i-1;
end