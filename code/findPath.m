function varargout = findPath(varargin)
% FINDPATH MATLAB code for findPath.fig
%      FINDPATH, by itself, creates a new FINDPATH or raises the existing
%      singleton*.
%
%      H = FINDPATH returns the handle to a new FINDPATH or the handle to
%      the existing singleton*.
%
%      FINDPATH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINDPATH.M with the given input arguments.
%
%      FINDPATH('Property','Value',...) creates a new FINDPATH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before findPath_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to findPath_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help findPath

% Last Modified by GUIDE v2.5 07-May-2023 10:55:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @findPath_OpeningFcn, ...
                   'gui_OutputFcn',  @findPath_OutputFcn, ...
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


% --- Executes just before findPath is made visible.
function findPath_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to findPath (see VARARGIN)

% Choose default command line output for findPath
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes findPath wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = findPath_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath("..\DCT for 3D surfaces\surface DCT Codings\GA_and_ACA");
OCurve = evalin('base','surfaceData.curve');
[NCurve,bestPath] = findPath_GA(OCurve);
assignin('base','NCurve',NCurve);
assignin('base','bestPath',bestPath);
set(findPath,'Visible','on');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath("..\DCT for 3D surfaces\surface DCT Codings");
NCurve = evalin('base','NCurve');
bestPath = evalin('base','bestPath');

curve = evalin('base','surfaceData.curve');
[index,MAX_N]=surfacePlot(NCurve,curve,bestPath);
index
length(index)
set(findPath,'Visible','on');



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath("..\DCT for 3D surfaces\surface DCT Codings");
curve = evalin('base','curve');
plotPath(curve);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close all
button=questdlg('Do you want to clear workspace?', 'Continue Operation','Yes','No','Help','No')
if strcmp(button,'Yes')
evalin('base','clear');
elseif strcmp(button,'No')
disp('Canceled clearing workspace')
elseif strcmp(button,'Help')
disp('Sorry,default!')
end

