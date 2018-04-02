function AcquiringImages()
%Amanda Devillier
%Feb 28
%Beginning of script to get photos
%clear all;
webcamlist  
cam = webcam(1); 


%% 
%Bottom right
good = 0;
while good == 0
    disp('Please look at the left side of the screen');
    
    pause(3);
    left = snapshot(cam);
    figure;
    image(left);
    
    answer = menu('Is this a good picture?','Yes','No');
    
    if answer == 1
        good = 1;
    else
        good = 0;
    end
end
close all;

% %Top right
good =0;
while good == 0
    disp('Please look at the right side of the screen')
    
    pause(3);
    right = snapshot(cam);
    figure;
    image(right);
    answer = menu('Is this a good picture?','Yes','No');
    
    if answer == 1
        good = 1;
    else
        good = 0;
    end
end
close all;

%IMPORTANT
%Stores Images for further use.
%Images must be cropped or resized before processing them.
rawImages(1,:) = ImageFlattener(right);
rawImages(2,:) = ImageFlattener(left);
%rawImages(3,:) = ImageFlattener(upleft);
%rawImages(4,:) = ImageFlattener(downleft);
save('Matrix Images.mat','rawImages');