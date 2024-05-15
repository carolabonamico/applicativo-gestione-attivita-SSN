function varargout = leggi(varargin)
% LEGGI MATLAB code for leggi.fig
%      LEGGI, by itself, creates a new LEGGI or raises the existing
%      singleton*.
%
%      H = LEGGI returns the handle to a new LEGGI or the handle to
%      the existing singleton*.
%
%      LEGGI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEGGI.M with the given input arguments.
%
%      LEGGI('Property','Value',...) creates a new LEGGI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before leggi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to leggi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help leggi

% Last Modified by GUIDE v2.5 29-Jan-2019 16:14:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @leggi_OpeningFcn, ...
                   'gui_OutputFcn',  @leggi_OutputFcn, ...
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


% --- Executes just before leggi is made visible.
function leggi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to leggi (see VARARGIN)

% Choose default command line output for leggi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes leggi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = leggi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function mostra_Callback(hObject, eventdata, handles)
% hObject    handle to mostra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mostra as text
%        str2double(get(hObject,'String')) returns contents of mostra as a double


% --- Executes during object creation, after setting all properties.
function mostra_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mostra (see GCBO)
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

% --- Executes on button press in cerca_file.
function cerca_file_Callback(hObject, eventdata, handles)
% hObject    handle to cerca_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nomefile percorso]=uigetfile('*.*');
nomeCompleto=strcat(percorso,nomefile);
set(handles.mostra,'String',nomeCompleto);



% --- Executes on button press in leggi_file.
function leggi_file_Callback(hObject, eventdata, handles)
% hObject    handle to leggi_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nomefile=get(handles.mostra,'String');
[numeri testo SDO]=xlsread('OSPEDALE4_Reg1.xls');
clear numeri;
clear testo;

winopen('OSPEDALE4_Reg1.xls');


% --- Executes on button press in home5.
function home5_Callback(hObject, eventdata, handles)
% hObject    handle to home5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
schermata;
close(leggi);