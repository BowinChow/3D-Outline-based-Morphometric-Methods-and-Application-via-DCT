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

% Last Modified by GUIDE v2.5 18-Mar-2023 14:43:19

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
axes(handles.axes1);
cla reset;
NDcurve = evalin('base','s1.NDcurve');
N= evalin('base','N');
[coefficients,max_n]=DCT_fitting(NDcurve,N);
assignin('base','coef',coefficients);
[dis] = PlotError(N,NDcurve);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname,filterindex]=uigetfile('*.mat','打开数据');
strcat([pathname filename]); 
s1 = load (strcat([pathname filename])); %strcat是组成路径的，记不得是不是这么写了。
assignin('base', 's1', s1)







% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function harm_Callback(hObject, eventdata, handles)
% hObject    handle to harm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of harm as text
%        str2double(get(hObject,'String')) returns contents of harm as a double

harmonic = get(handles.harm,'string');
H = str2num(harmonic);
assignin('base','N',H);


% --- Executes during object creation, after setting all properties.
function harm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to harm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%to be continued.


% --- Executes on button press in PCAButton.
function PCAButton_Callback(hObject, eventdata, handles)
   
    load fisheriris;
    X = meas;                 % n = 150, m = 4
    meanX = ones(size(X,1), 1) * mean(X);  % 中心化处理
    
    centredX = X - meanX;
    
    C = cov(centredX);	        % 直接调用cov直接计算协方差矩阵即可
    
    [W, Lambda] = eig(C);       % W是特征向量组成的矩阵（4×4），Lambda是特征值组成的对角矩阵
    ev = (diag(Lambda))';		% 提取特征值
    ev = ev(:, end:-1:1);		    % eig计算出的特征值是升序的，这里手动倒序（W同理）
    W = W(:, end:-1:1);
    sum(W.*W, 1)             % 可以验证每个特征向量各元素的平方和均为
    
    Wr = W(:, 1:2);             % 提取前两个主成分的特征向量
    Tr = centredX * Wr;         %  新坐标空间的数据点
%     % 作图
%     figure;
%     stairs(cumsum(ev)/sum(ev), 'LineWidth',1.5);
%     axis([1 4 0 1]);
%     xlabel('$ k $', 'Interpreter', 'latex');
%     ylabel('$ f(k)=\frac{\sum _{i=1}^i \lambda_k}{\sum_{i=1}^m \lambda_i} $',...
%         'Interpreter', 'latex');
%     hold on;
%     plot([1 4], [0.95 0.95], '--');  % 从图中可以看出，r为方差贡献率，取r = 2
    figure;
    scatter(Tr(:,1), Tr(:,2), 180, categorical(species), '.');
    colormap(winter);
    xlabel('PC 1');
    ylabel('PC 2');
    [U, Sigma, V] = svd(X);              % 可以检验，W和V完全相同（向量的正负号不影响）
    Vr = V(:, 1:2);                      % 提取前两个主成分的特征向量
    Tr = X * Vr;                        % 新坐标空间的数据点
    % 画图部分同上
    % [loadings, scores] = pca(X, 'NumComponents', r);
    [Wr, Tr, ev] = pca(X, 'NumComponents',2);   % 画图部分
    axis equal
    grid on

