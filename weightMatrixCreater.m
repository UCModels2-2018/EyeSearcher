function weightMatrixCreater(rawImages)
clc;
%load('Matrix Images.mat');
weights = zeros(size(rawImages,2), size(rawImages,2),'single');
for j = 1:size(rawImages,1)
    weights = weights + (rawImages(j,:)')*(rawImages(j,:));
end
for j=1:size(rawImages,2)
    for k=1:size(rawImages,2)
        if j==k
            weights(j,k)=0;
        end
    end
end
save('weightMatrix','weights');