%Font
clear; close all; clc;
[X1,map1]=imread('Impact.png'); % Choose between 'Impact' | 'FrenchScriptMT' | 'TimesNewRoman'
[X2,map2]=imread('FrenchScriptMT.png');
subplot(1,3,1), imshow(X1,map1)
subplot(1,3,3), imshow(X2,map2)
set(gcf, 'Position', get(0, 'Screensize'));
%Color
clear; close all; clc;
image = zeros(600,1400,3);
%color concentration ranges between 0 and 1
image(:,1:300,1) = 0.5;  %Red on the left
image(:,1:300,2) = 0.7;  %Green on the left
image(:,1:300,3) = 0.89;  %Blue on the left
image(:,1101:1400,1) = 1;  %Red on the right
image(:,1101:1400,2) = 0;  %Green on the right
image(:,1101:1400,3) = 0;  %Blue on the right
imshow(image)
set(gcf, 'Position', get(0, 'Screensize'));
%Shape
clear; close all; clc;
[X1,map1]=imread('Circle.png'); %Choose between 'Circle' | 'Triangle' | 'Square'
[X2,map2]=imread('Triangle.png');
subplot(1,3,1), imshow(X1,map1)
subplot(1,3,3), imshow(X2,map2)
set(gcf, 'Position', get(0, 'Screensize'));
