function eyeDirection = EyeSearcher(ImageRGB)
%Finds Eyes for processing
clear; clc; clf;
endFlag = false;
while(~endFlag)
    %Converts images into HSV images for thresholding
    ImageGray = rgb2gray(ImageRGB);
    ImageHSV = rgb2hsv(ImageRGB);
    ImageHSV = impyramid(ImageHSV,'reduce');
    ImageVBinary = zeros(size(ImageHSV,1),size(ImageHSV,2));
    
    %Value filter
    for j = 1:size(ImageHSV,1)
        for k = 1:size(ImageHSV,2)
            if (ImageHSV(j,k,1)> 0/360 && ImageHSV(j,k,1)<360/360)&&(ImageHSV(j,k,2)> 0 && ImageHSV(j,k,2)<1)&&(ImageHSV(j,k,3)> 0 && ImageHSV(j,k,3)<0.2)
                ImageVBinary(j,k) = 1;
            else
                ImageVBinary(j,k) = 0;
            end
        end
    end
    
    %Binarizes and blurs image to reduce noise
    ImageVBinary = imbinarize(ImageVBinary);
    ImageVBinary = medfilt2(ImageVBinary,[7 7]);
    
    %Finds centroids for possible eye locations
    try
        s = regionprops(ImageVBinary,'centroid','area');
        centroids = cat(1,s.Centroid);
        for j = 1: length(centroids)-1
            isLessThanUpperBound = centroids(j,2)> centroids(j+1,2) && centroids(j,2)< centroids(j+1,2)+20;
            isGreaterThanLowerBound = centroids(j,2)< centroids(j+1,2) && centroids(j,2)> centroids(j+1,2)-20;
            if isLessThanUpperBound || isGreaterThanLowerBound
                croppingBounds = int32([centroids(j,1)-25 centroids(j,2)-25 50 50]);
                eyeDirection = faceneuralnetwork(crop(ImageGray,croppingBounds));
                if eyeDirection ~= 0
                    return;
                end
            end
        end
        %imshow(ImageVBinary);
        %hold on;
        %plot(centroids(:,1),centroids(:,2),'*b');
        %hold off;
    catch
        %endFlag = true;
    end
    eyeDirection = 0;
end