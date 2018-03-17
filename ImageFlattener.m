function flattenedImage = ImageFlattener(inputImage)
inputImage = double(rgb2gray(inputImage));
flattenedImage = inputImage(:);
flattenedImage = flattenedImage/255;
for j = 1: length(flattenedImage)
    if flattenedImage(j) > 0.75
        flattenedImage(j) = 1;
    else
        flattenedImage(j) = -1;
    end
end