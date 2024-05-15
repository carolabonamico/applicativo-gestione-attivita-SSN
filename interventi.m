function varargout = interventi(varargin)
% INTERVENTI MATLAB code for interventi.fig
%      INTERVENTI, by itself, creates a new INTERVENTI or raises the existing
%      singleton*.
%
%      H = INTERVENTI returns the handle to a new INTERVENTI or the handle to
%      the existing singleton*.
%
%      INTERVENTI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERVENTI.M with the given input arguments.
%
%      INTERVENTI('Property','Value',...) creates a new INTERVENTI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interventi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interventi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interventi

% Last Modified by GUIDE v2.5 25-Jan-2019 12:52:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interventi_OpeningFcn, ...
                   'gui_OutputFcn',  @interventi_OutputFcn, ...
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


% --- Executes just before interventi is made visible.
function interventi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interventi (see VARARGIN)

% Choose default command line output for interventi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interventi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interventi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in tag_interventi.
function tag_interventi_Callback(hObject, eventdata, handles)
% hObject    handle to tag_interventi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tag_interventi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tag_interventi

selection=get(handles.tag_interventi,'value')
  [ANNO,AZIENDA,ISTITUTO,DISCIPLINA_DIMISSIONE,PROGRESSIVO_REPARTO,REGIME_RICOVERO,PROVENIENZA,DRG,GIORNATE_DEGENZA,ACCESSI_IN_DH,IMPORTO_REGIONALE,DATA_DIMISSIONE,COMUNE_RESIDENZA,ETA,SESSO,DIAGNOSI_PRINCIPALE,DIAGNOSI_CONCOMITANTE1,DIAGNOSI_CONCOMITANTE2,DIAGNOSI_CONCOMITANTE3,DIAGNOSI_CONCOMITANTE4,INTERVENTO_PRINCIPALE,INTERVENTO_SECONDARIO1,INTERVENTO_SECONDARIO2,INTERVENTO_SECONDARIO3,INTERVENTO_SECONDARIO4,MODALITA_ACCESSO,MODALITA_DIMISSIONE,TIPO_DI_RICOVERO,DATA_INGRESSO,TIPO_PRESCRITTORE,CODICE_NOSOLOGICO]=textread('OSPEDALE4_Reg1.csv','%s%s%s%s%s%s%s%s%d%d%d%s%s%d%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s','delimiter',';');

 axes(handles.grafico10)
if selection==1
   
    interventi_senza_vuoti=INTERVENTO_PRINCIPALE(~cellfun('isempty',INTERVENTO_PRINCIPALE));
lista_intervento_principale=unique(interventi_senza_vuoti);
frequenza_intervento_principale=zeros(1,length(lista_intervento_principale));
for i=1:length(lista_intervento_principale)
    frequenza_intervento_principale(i)=length(find(strcmp(lista_intervento_principale{i},interventi_senza_vuoti)));
end

bar(frequenza_intervento_principale,'r');
title('frequenza intervento principale');
    
end
if selection ==2
    interventi_senza_vuoti2=INTERVENTO_SECONDARIO1(~cellfun('isempty',INTERVENTO_SECONDARIO1));
lista_intervento_secondario1=unique(interventi_senza_vuoti2);
frequenza_intervento_secondario1=zeros(1,length(lista_intervento_secondario1));
for i=1:length(lista_intervento_secondario1)
    frequenza_intervento_secondario1(i)=length(find(strcmp(lista_intervento_secondario1{i},interventi_senza_vuoti2)));
end

bar(frequenza_intervento_secondario1,'g');
title('frequenza intervento secondario1');
    
end
if selection==3
    interventi_senza_vuoti3=INTERVENTO_SECONDARIO2(~cellfun('isempty',INTERVENTO_SECONDARIO2));
lista_intervento_secondario2=unique(interventi_senza_vuoti3);
frequenza_intervento_secondario2=zeros(1,length(lista_intervento_secondario2));
for i=1:length(lista_intervento_secondario2)
    frequenza_intervento_secondario2(i)=length(find(strcmp(lista_intervento_secondario2{i},interventi_senza_vuoti3)));
end

bar(frequenza_intervento_secondario2,'b');
title('frequenza intervento secondario2');
    
end
if selection==4
   interventi_senza_vuoti4=INTERVENTO_SECONDARIO3(~cellfun('isempty',INTERVENTO_SECONDARIO3));
lista_intervento_secondario3=unique(interventi_senza_vuoti4);
frequenza_intervento_secondario3=zeros(1,length(lista_intervento_secondario3));
for i=1:length(lista_intervento_secondario3)
    frequenza_intervento_secondario3(i)=length(find(strcmp(lista_intervento_secondario3{i},interventi_senza_vuoti4)));
end

bar(frequenza_intervento_secondario3,'g');
title('frequenza intervento secondario3');
    
end
if selection==5
    interventi_senza_vuoti5=INTERVENTO_SECONDARIO4(~cellfun('isempty',INTERVENTO_SECONDARIO4));
lista_intervento_secondario4=unique(interventi_senza_vuoti5);
frequenza_intervento_secondario4=zeros(1,length(lista_intervento_secondario4));
for i=1:length(lista_intervento_secondario4)
    frequenza_intervento_secondario4(i)=length(find(strcmp(lista_intervento_secondario4{i},interventi_senza_vuoti5)));
end

bar(frequenza_intervento_secondario4,'r');
title('frequenza intervento secondario4');
    
end

% --- Executes during object creation, after setting all properties.
function tag_interventi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tag_interventi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
assi = axes('unit', 'normalized', 'position', [0 0 1 1]);
sfondo = imread('blue.jpg');
imagesc(sfondo);
set(assi, 'handlevisibility', 'off', 'visible', 'off')
uistack(assi,'bottom')
set(gcf, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8])
