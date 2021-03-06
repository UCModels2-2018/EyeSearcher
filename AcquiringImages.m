%Amanda Devillier
%Feb 28
%Beginning of script to get photos
clear all;
webcamlist  
cam = webcam(1); 


%% 
%Bottom right
good = 0;
while good == 0
    disp('Please look at the bottom right corner of the screen');
    
    pause(3);
    downright = snapshot(cam);
    image(downright)
    
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
    disp('Please look at the top right corner of the screen')
    
    pause(3);
    upright = snapshot(cam);
    image(upright)
    answer = menu('Is this a good picture?','Yes','No');
    
    if answer == 1
        good = 1;
    else
        good = 0;
    end
end
close all;
% %Top left
good = 0;
while good == 0
    disp('Please look at the top left corner of the screen')
    
    pause(3);
    upleft = snapshot(cam);
    image(upleft)
    answer = menu('Is this a good picture?','Yes','No');
    
    if answer == 1
        good = 1;
    else
        good = 0;
    end
end
close all;
% %Bottom left
good = 0;
while good == 0
    disp('Please look at the bottom left corner of the screen');
    
    pause(3);
    downleft = snapshot(cam);
    image(downleft)
    answer = menu('Is this a good picture?','Yes','No');
    
    if answer == 1
        good = 1;
    else
        good = 0;
    end
end
clear cam;
close all;

%IMPORTANT
%Stores Images for further use.
%Images must be cropped or resized before processing them.
rawImages(1,:) = ImageFlattener(downright);
rawImages(2,:) = ImageFlattener(upright);
rawImages(3,:) = ImageFlattener(upleft);
rawImages(4,:) = ImageFlattener(downleft);
save('Matrix Images.mat','rawImages');