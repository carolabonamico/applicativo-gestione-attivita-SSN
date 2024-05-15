function varargout = lettura_report_regione(varargin)
% LETTURA_REPORT_REGIONE MATLAB code for lettura_report_regione.fig
%      LETTURA_REPORT_REGIONE, by itself, creates a new LETTURA_REPORT_REGIONE or raises the existing
%      singleton*.
%
%      H = LETTURA_REPORT_REGIONE returns the handle to a new LETTURA_REPORT_REGIONE or the handle to
%      the existing singleton*.
%
%      LETTURA_REPORT_REGIONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LETTURA_REPORT_REGIONE.M with the given input arguments.
%
%      LETTURA_REPORT_REGIONE('Property','Value',...) creates a new LETTURA_REPORT_REGIONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lettura_report_regione_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lettura_report_regione_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lettura_report_regione

% Last Modified by GUIDE v2.5 29-Jan-2019 16:05:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lettura_report_regione_OpeningFcn, ...
                   'gui_OutputFcn',  @lettura_report_regione_OutputFcn, ...
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


% --- Executes just before lettura_report_regione is made visible.
function lettura_report_regione_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lettura_report_regione (see VARARGIN)

% Choose default command line output for lettura_report_regione
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lettura_report_regione wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lettura_report_regione_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function mostra1_Callback(hObject, eventdata, handles)
% hObject    handle to mostra1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mostra1 as text
%        str2double(get(hObject,'String')) returns contents of mostra1 as a double


% --- Executes during object creation, after setting all properties.
function mostra1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mostra1 (see GCBO)
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


% --- Executes on button press in cerca_file1.
function cerca_file1_Callback(hObject, eventdata, handles)
% hObject    handle to cerca_file1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nomefile percorso]=uigetfile('*.*');
nomeCompleto=strcat(percorso,nomefile);
set(handles.mostra1,'String',nomeCompleto);



% --- Executes on button press in leggi_file1.
function leggi_file1_Callback(hObject, eventdata, handles)
% hObject    handle to leggi_file1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nomefile=get(handles.mostra1,'String');
documento=xmlread('REPORT_OSPEDALE4.xml');
radice=getDocumentElement(documento);
ICM=radice.getAttribute('ICM');
ICP=radice.getAttribute('ICP');
cod_osp=radice.getAttribute('cod_osp');
DRG=radice.getElementsByTagName('DRG');
num_DRG= DRG.getLength;
    for i=1:num_DRG
    drg(i)=DRG.item(i-1);
    D(i)=drg(i).getAttribute('D');
    P(i)=drg(i).getAttribute('P');
    cod_drg(i)=drg(i).getAttribute('cod_drg');
end
    

winopen ('REPORT_OSPEDALE4.xml')


% --- Executes on button press in home4.
function home4_Callback(hObject, eventdata, handles)
% hObject    handle to home4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
schermata;
close(lettura_report_regione);