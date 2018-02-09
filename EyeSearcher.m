clear; clc; clf;
endFlag = false;
while(~endFlag)
    ImageRGB = snapshot(webcam(1));%imread();
    ImageHSV = rgb2hsv(ImageRGB);
    ImageHSV = impyramid(ImageHSV,'reduce');
    ImageVBinary = zeros(size(ImageHSV,1),size(ImageHSV,2));
    ImageHBinary = ImageVBinary;
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
    %Hue filter
    for j = 1:size(ImageHSV,1)
        for k = 1:size(ImageHSV,2)
            if (ImageHSV(j,k,1)> 0/360 && ImageHSV(j,k,1)<15/360)||(ImageHSV(j,k,1)> 330/360 && ImageHSV(j,k,2)<360/360)
                ImageHBinary(j,k) = 1;
            else
                ImageHBinary(j,k) = 0;
            end
        end
    end
    ImageVBinary = imbinarize(ImageVBinary);
    ImageHBinary = imbinarize(ImageHBinary);
    ImageVBinary = medfilt2(ImageVBinary,[7 7]);
    %ImageHBinary = medfilt2(ImageHBinary,[15 15]);
    try
    s = regionprops(ImageVBinary,'centroid','area');
    centroids = cat(1,s.Centroid);
    imshow(ImageVBinary);
    hold on;
    plot(centroids(:,1),centroids(:,2),'*b');
    hold off;
    endFlag = size(ImageVBinary(:),1)<(sum(sum(ImageVBinary == 1))*4);
    catch
        %endFlag = true;
    end
end