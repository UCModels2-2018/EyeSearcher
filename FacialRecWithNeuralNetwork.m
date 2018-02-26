%Amanda Devillier
%February 20, 2018
%Facial Recognition Using Neural Networking

clear all;
clc;

%Read image and double size
downright1= double(imread('downright1.jpg'));
upleft1= double(imread('upleft1.png'));
upleft2= double(imread('upleft2.png'));
upright1= double(imread('upright1.png'));

%Resize all images to the same size
downright1 = imresize(downright1,[200,200]);
upright1 = imresize(upright1,[200,200]);
upleft1 = imresize(upleft1,[200,200]);
upleft2 = imresize(upleft2,[200,200]);

%Convert RBG colormap to grayscale
downright1 = rgb2gray(downright1);
upright1 = rgb2gray(upright1);
upleft1 = rgb2gray(upleft1);
upleft2 = rgb2gray(upleft2);

%Empty weights vector
weights1 = zeros(200,200);
weights2 = zeros(200,200);
weights3 = zeros(200,200);
weights4 = zeros(200,200);

%Pull out rows of images

for k =1:200
    vector1 = downright1(k,:);
    vector2 = upright1(k,:);
    vector3 = upleft1(k,:);
    vector4 = upleft2(k,:);
    
    product1 = vector1'*vector1;
    product2 = vector2'*vector2;
    product3 = vector3'*vector3;
    product4 = vector4'*vector4;
end


for r=1:200
    for c=200
        if r==c
            weights1(r,c) = 0;
            weights2(r,c) = 0;
            weights3(r,c) = 0;
            weights4(r,c) = 0;
        end
    end
end


%Add some noise in
for q=1:200
noiseLevel = .2
noisePattern1 = downright1(q,:);
noisePattern1 = AddNoise(noisePattern1, noiseLevel);

noisePattern2 = upright1(q,:);
noisePattern2 = AddNoise(noisePattern2, noiseLevel);

noisePattern3 = upleft1(q,:);
noisePattern3 = AddNoise(noisePattern3, noiseLevel);

noisePattern4 = upleft2(q,:);
noisePattern4 = AddNoise(noisePattern4, noiseLevel);


end


%Comparing Image to EyeFinder





