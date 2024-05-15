function varargout = lettura_json(varargin)
% LETTURA_JSON MATLAB code for lettura_json.fig
%      LETTURA_JSON, by itself, creates a new LETTURA_JSON or raises the existing
%      singleton*.
%
%      H = LETTURA_JSON returns the handle to a new LETTURA_JSON or the handle to
%      the existing singleton*.
%
%      LETTURA_JSON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LETTURA_JSON.M with the given input arguments.
%
%      LETTURA_JSON('Property','Value',...) creates a new LETTURA_JSON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lettura_json_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lettura_json_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lettura_json

% Last Modified by GUIDE v2.5 29-Jan-2019 16:04:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lettura_json_OpeningFcn, ...
                   'gui_OutputFcn',  @lettura_json_OutputFcn, ...
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


% --- Executes just before lettura_json is made visible.
function lettura_json_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lettura_json (see VARARGIN)

% Choose default command line output for lettura_json
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lettura_json wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lettura_json_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function mostra3_Callback(hObject, eventdata, handles)
% hObject    handle to mostra3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mostra3 as text
%        str2double(get(hObject,'String')) returns contents of mostra3 as a double


% --- Executes during object creation, after setting all properties.
function mostra3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mostra3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
assi = axes('unit', 'normalized', 'position', [0 0 1 1]);
sfondo = imread('blue.jpg');
imagesc(sfondo);
set(assi, 'handlevisibility', 'off', 'visible', 'off')
uistack(assi,'bottom')

% --- Executes on button press in cerca_file2.
function cerca_file2_Callback(hObject, eventdata, handles)
% hObject    handle to cerca_file2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[nomefile percorso]=uigetfile('*.*');
nomeCompleto=strcat(percorso,nomefile);
set(handles.mostra3,'String',nomeCompleto);

% --- Executes on button press in leggi_file2.
function leggi_file2_Callback(hObject, eventdata, handles)
% hObject    handle to leggi_file2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nomefile=get(handles.mostra3,'String');
%fname='JSON_OSPEDALE4.json';
%fid=fopen(fname);
%raw=fread(fid,inf);
%str=char(raw');
%fclose(fid);
%val=jsondecode(str);


% --- Executes on button press in apri.
function apri_Callback(hObject, eventdata, handles)
% hObject    handle to apri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('JSON_OSPEDALE4.json');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
schermata;
close (lettura_json);
