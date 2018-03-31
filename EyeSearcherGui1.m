function varargout = EyeSearcherGui1(varargin)
% EYESEARCHERGUI1 MATLAB code for EyeSearcherGui1.fig
%      EYESEARCHERGUI1, by itself, creates a new EYESEARCHERGUI1 or raises the existing
%      singleton*.
%
%      H = EYESEARCHERGUI1 returns the handle to a new EYESEARCHERGUI1 or the handle to
%      the existing singleton*.
%
%      EYESEARCHERGUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EYESEARCHERGUI1.M with the given input arguments.
%
%      EYESEARCHERGUI1('Property','Value',...) creates a new EYESEARCHERGUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EyeSearcherGui1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EyeSearcherGui1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EyeSearcherGui1

% Last Modified by GUIDE v2.5 22-Mar-2018 16:04:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EyeSearcherGui1_OpeningFcn, ...
                   'gui_OutputFcn',  @EyeSearcherGui1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before EyeSearcherGui1 is made visible.
function EyeSearcherGui1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EyeSearcherGui1 (see VARARGIN)

% Choose default command line output for EyeSearcherGui1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EyeSearcherGui1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EyeSearcherGui1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calibrate.
function calibrate_Callback(hObject, eventdata, handles)
% hObject    handle to calibrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
webcamlist  
cam = webcam(1); 

%Bottom right
good = 0
while good == 0

f = msgbox('Please look at the BOTTOM RIGHT corner of the screen');

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


% %Top right
good =0;
while good == 0

f = msgbox('Please look at the TOP RIGHT corner of the screen');
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
% %Top left
good = 0;
while good == 0

f = msgbox('Please look at the TOP LEFT corner of the screen');
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
 
% %Bottom left
good = 0;
while good == 0

f = msgbox('Please look at the BOTTOM LEFT corner of the screen');
pause(3);
downleft = snapshot(cam);
image(downleft)
answer = menu('Is this a good picture?','Yes','No')

if answer == 1
    good = 1;
else 
    good = 0;
end
end

%IMPORTANT
%Stores Images for further use.
%Images must be cropped or resized before processing them. ,.m 
rawImages(1,:) = ImageFlattener(downright);
rawImages(2,:) = ImageFlattener(upright);
rawImages(3,:) = ImageFlattener(upleft);
rawImages(4,:) = ImageFlattener(downleft);
save('Matrix Images.mat','rawImages');

% --- Executes on button press in test.
function test_Callback(hObject, eventdata, handles)
% hObject    handle to test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
