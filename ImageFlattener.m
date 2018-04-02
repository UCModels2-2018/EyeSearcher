function flattenedImage = ImageFlattener(inputImage)
%inputImage = ImageResizer(inputImage);
inputImage = double(rgb2gray(inputImage));
flattenedImage = inputImage(:);
flattenedImage = imageThresholder(flattenedImage);