function outputImage = ImageResizer(inputImage)
inputImage = rgb2gray(inputImage);
inputImage = imcrop(inputImage,[size(inputImage,2)/3 0 size(inputImage,2)/3 size(inputImage,1)]);
outputImage = imresize(inputImage,0.25);