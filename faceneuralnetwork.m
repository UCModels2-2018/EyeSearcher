function eyeDirection = faceneuralnetwork(inputImage)
load('weightMatrix',weights);
% actual comparison
%May want to run twice for both eyes
compare=inputImage*weights;
compare = exp(compare)./(exp(compare) + 1);
for i=1:36
    if compare(i)>0.9
        compare(i)=1;
    else
        compare(i)=-1;
    end
end
%the second number in scoreVal is dependent on how many photos we have
scoreVal= zeros([1 4]);
for i=1:36
    if outputVector(i)==(ImgVectordr1(1,i))
        scoreVal(1)=scoreVal(1)+1;
    end
    if outputVector(i)==(ImgVectorul1(2,i))
        scoreVal(2)=scoreVal(2)+1;
    end
    if outputVector(i)==(ImgVectorul2(3,i))
        scoreVal(3)=scoreVal(3)+1;
    end
    if outputVector(i)==(ImgVectorur1(4,i))
        scoreVal(4)=scoreVal(4)+1;
    end
    %keep adding ifs for more pictures
end
%both numbers dependant on num of pics
i=3;
winner=4;
while i>0  
    if scoreVal(i)>=scoreVal(winner)
        winner=i;
    end
    i=i-1;
end
eyeDirection = 0;
%since the next part would be winner==# and then give where they look
%and theres not many pictures ive decided to let it go for now