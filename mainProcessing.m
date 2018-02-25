%Main Processing Script
clear; clc; close all;

%%%%%%%%%%%%%%%%%%%%
%INSERT IMAGE AQUISION
%load test data
%single out test image(s)
%%%%%%%%%%%%%%%%%%%%

% test images
eyeDirections = zeros(length(testImages),1);
for j =1: length(testImages)
eyeDirections(j) = EyeSearcher(testImage);
end

%Save data
save('EyeDirections',test1Directions);

%%%%%%%%%%%%%%%%%%%%
%INSERT STATISTICS PROCESSING
%find mode of each test most likely
%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
%OUTPUT
%%%%%%%%%%%%%%%%%%%%