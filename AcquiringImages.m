%Amanda Devillier
%Feb 28
%Beginning of script to get photos

webcamlist  
cam = webcam(1) 


%% 
%Bottom right
good = 0
while good == 0

f = msgbox('Please look at the BOTTOM RIGHT corner of the screen');

pause(3);
downright1 = snapshot(cam);
image(downright1)

answer = menu('Is this a good picture?','Yes','No');

if answer == 1
    good = 1;
else 
    good = 0;
end
end


% %Top right
good =0;
while good == 0

f = msgbox('Please look at the TOP RIGHT corner of the screen');
pause(3);
upright1 = snapshot(cam);
image(upright1)
answer = menu('Is this a good picture?','Yes','No');

if answer == 1
    good = 1;
else 
    good = 0;
end
end
% %Top left
good = 0;
while good == 0

f = msgbox('Please look at the TOP LEFT corner of the screen');
pause(3);
upleft1 = snapshot(cam);
image(upleft1)
answer = menu('Is this a good picture?','Yes','No');

if answer == 1
    good = 1;
else 
    good = 0;
end
end
 
% %Bottom left
good = 0;
while good == 0

f = msgbox('Please look at the BOTTOM LEFT corner of the screen');
pause(3);
upleft2 = snapshot(cam);
image(upleft2)
answer = menu('Is this a good picture?','Yes','No')

if answer == 1
    good = 1;
else 
    good = 0;
end
end