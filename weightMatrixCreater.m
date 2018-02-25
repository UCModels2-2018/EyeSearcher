clear; clc;
downright1= double(imread('downright1.jpg'));
upleft1= double(imread('upleft1.png'));
upleft2= double(imread('upleft2.png'));
upright1= double(imread('upright1.png'));

downright1 = rgb2gray(downright1);
upleft1= rgb2gray(upleft1);
upleft2= rgb2gray(upleft2);
upright1= rgb2gray(upright1);

downright1 = imresize(downright1,[150 150]);
upleft1 = imresize(upleft1,[150 150]);
upleft2 = imresize(upleft2,[150 150]);
upright1 = imresize(upright1,[150 150]);

ImgVectordr1 = downright1(1,:);
ImgVectorul1 = upleft1(1,:);
ImgVectorul2 = upleft2(1,:);
ImgVectorur1 = upright1(1,:);

v1m=(ImgVectordr1')*ImgVectordr1;
v2m=(ImgVectorul1')*ImgVectorul1;
v3m=(ImgVectorul2')*ImgVectorul2;
v4m=(ImgVectorur1')*ImgVectorur1;
weights=v1m+v2m+v3m+v4m;
for i=1:150
    for j=1:150
        if i==j
            weights(i,j)=0;
        end
    end
end
save('weightMatrix',weights);