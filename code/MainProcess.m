function varargout = MainProcess(varargin)
% MAINPROCESS MATLAB code for MainProcess.fig
%      MAINPROCESS, by itself, creates a new MAINPROCESS or raises the existing
%      singleton*.
%
%      H = MAINPROCESS returns the handle to a new MAINPROCESS or the handle to
%      the existing singleton*.
%
%      MAINPROCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINPROCESS.M with the given input arguments.
%
%      MAINPROCESS('Property','Value',...) creates a new MAINPROCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainProcess_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainProcess_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainProcess

% Last Modified by GUIDE v2.5 12-Nov-2022 11:01:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainProcess_OpeningFcn, ...
                   'gui_OutputFcn',  @MainProcess_OutputFcn, ...
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


% --- Executes just before MainProcess is made visible.
function MainProcess_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainProcess (see VARARGIN)

% Choose default command line output for MainProcess
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainProcess wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainProcess_OutputFcn(hObject, eventdata, handles) 
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
x = 0:0.1:2*pi;
y = sin(x);
y2 = cos(2*x);
plot(x,y,".");
hold on
plot(x,y2,"r:");
axis equal;
grid on