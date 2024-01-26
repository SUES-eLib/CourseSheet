function varargout = test(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
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


% --- Executes just before test is made visible.
function test_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = test_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

[filename1, pathname1] = uigetfile('*.bmp', '选择载体图片');
global pathfile1;
global pathfre;
pathfile1=fullfile(pathname1, filename1);
pathfre = pathname1;
img=imread(pathfile1);
axes(handles.axes1);
image(img);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

[filename2, pathname2] = uigetfile('*.bmp', '选择水印图片');
global pathfile2;
pathfile2=fullfile(pathname2, filename2);
img=imread(pathfile2);
axes(handles.axes2);
image(img);

%水印置乱
function pushbutton6_Callback(hObject, eventdata, handles)
global pathfile2;
%global pathfile6;
global pathfre;
img = Arnold1(pathfile2);
%pathfile6=fullfile(pathfre, 'randwater.bmp');
pathfile2=fullfile(pathfre,'randwater.bmp');
imwrite(img,pathfile2);
axes(handles.axes2);
imshow(img);

% --- Executes on button press in pushbutton3.水印嵌入
function pushbutton3_Callback(hObject, eventdata, handles)
global pathfile1;
global pathfile2;
global k1;
global k2;
img = qianru(pathfile1,pathfile2,k1,k2);
axes(handles.axes3);
image(img);


% --- Executes on selection change in popupmenu2.水印攻击
function popupmenu2_Callback(hObject, eventdata, handles)
global pathfile3;
global pathfre;
var=get(handles.popupmenu2,'value');
axes(handles.axes4);

switch var
    case 1
        after_attack = attack(var,pathfile3);
        imwrite(after_attack,fullfile(pathfre,'不攻击.bmp')); 
    case 2
        after_attack = attack(var,pathfile3);
        imwrite(after_attack,fullfile(pathfre,'白噪声.bmp')); 
    case 3
        after_attack = attack(var,pathfile3);
        imwrite(after_attack,fullfile(pathfre,'部分剪切.bmp')); 
    case 4
        after_attack = attack(var,pathfile3);
        imwrite(after_attack,fullfile(pathfre,'小波压缩.bmp')); 
    case 5
        after_attack = attack(var,pathfile3);
        imwrite(after_attack,fullfile(pathfre,'几何旋转.bmp')); 
end
img = after_attack;
global pathfile5;
pathfile5=fullfile(pathfre, 'after_attack.bmp');
imwrite(after_attack,pathfile5);
axes(handles.axes4);
imshow(img)

% --- Executes on button press in pushbutton5.水印提取
function pushbutton5_Callback(hObject, eventdata, handles)
global pathfile4;
global pathfile5;
global k1;
global k2;
tiqu(pathfile5,k1,k2);
img = imread(pathfile4);
axes(handles.axes5);
imshow(img)

% --- Executes on button press in pushbutton7.水印还原
function pushbutton7_Callback(hObject, eventdata, handles)

global pathfile4;
global pathfre;
tmppath = fullfile(pathfre,'realmark.bmp');
img = Arnold2(pathfile4);
imwrite(img,tmppath);
axes(handles.axes5);
imshow(img);

function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu2_DeleteFcn(hObject, eventdata, handles)
