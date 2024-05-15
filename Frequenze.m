function varargout = Frequenze(varargin)
% FREQUENZE MATLAB code for Frequenze.fig
%      FREQUENZE, by itself, creates a new FREQUENZE or raises the existing
%      singleton*.
%
%      H = FREQUENZE returns the handle to a new FREQUENZE or the handle to
%      the existing singleton*.
%
%      FREQUENZE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FREQUENZE.M with the given input arguments.
%
%      FREQUENZE('Property','Value',...) creates a new FREQUENZE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Frequenze_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Frequenze_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Frequenze

% Last Modified by GUIDE v2.5 25-Jan-2019 12:39:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Frequenze_OpeningFcn, ...
                   'gui_OutputFcn',  @Frequenze_OutputFcn, ...
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


% --- Executes just before Frequenze is made visible.
function Frequenze_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Frequenze (see VARARGIN)
assi = axes('unit', 'normalized', 'position', [0 0 1 1]);
sfondo = imread('blue.jpg');
imagesc(sfondo);
set(assi, 'handlevisibility', 'off', 'visible', 'off')
uistack(assi,'bottom')
set(gcf, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8])

% Choose default command line output for Frequenze
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Frequenze wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Frequenze_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in tag_diagnosi.
function tag_diagnosi_Callback(hObject, eventdata, handles)
% hObject    handle to tag_diagnosi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tag_diagnosi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tag_diagnosi
selection=get(handles.tag_diagnosi,'value')
  [ANNO,AZIENDA,ISTITUTO,DISCIPLINA_DIMISSIONE,PROGRESSIVO_REPARTO,REGIME_RICOVERO,PROVENIENZA,DRG,GIORNATE_DEGENZA,ACCESSI_IN_DH,IMPORTO_REGIONALE,DATA_DIMISSIONE,COMUNE_RESIDENZA,ETA,SESSO,DIAGNOSI_PRINCIPALE,DIAGNOSI_CONCOMITANTE1,DIAGNOSI_CONCOMITANTE2,DIAGNOSI_CONCOMITANTE3,DIAGNOSI_CONCOMITANTE4,INTERVENTO_PRINCIPALE,INTERVENTO_SECONDARIO1,INTERVENTO_SECONDARIO2,INTERVENTO_SECONDARIO3,INTERVENTO_SECONDARIO4,MODALITA_ACCESSO,MODALITA_DIMISSIONE,TIPO_DI_RICOVERO,DATA_INGRESSO,TIPO_PRESCRITTORE,CODICE_NOSOLOGICO]=textread('OSPEDALE4_Reg1.csv','%s%s%s%s%s%s%s%s%d%d%d%s%s%d%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s','delimiter',';');

 axes(handles.grafico9)
if selection==1
 %calcolo la frequenza delle diagnosi principali e concomitanti
lista_senza_vuoti=DIAGNOSI_PRINCIPALE(~cellfun('isempty',DIAGNOSI_PRINCIPALE));
lista_diagnosi_principale=unique(lista_senza_vuoti);
frequenza_diagnosi_principale=zeros(1,length(lista_diagnosi_principale));
for i=1:length(lista_diagnosi_principale)
    frequenza_diagnosi_principale(i)=length(find(strcmp(lista_diagnosi_principale{i},lista_senza_vuoti)));
end

bar(frequenza_diagnosi_principale,'b');
title('frequenza diagnosi principale');

    
    
end
if selection ==2
    lista_senza_vuoti2=DIAGNOSI_CONCOMITANTE1(~cellfun('isempty',DIAGNOSI_CONCOMITANTE1));
lista_diagnosi_concomitante1=unique(lista_senza_vuoti2);
frequenza_diagnosi_concomitante1=zeros(1,length(lista_diagnosi_concomitante1));
for i=1:length(lista_diagnosi_concomitante1)
    frequenza_diagnosi_concomitante1(i)=length(find(strcmp(lista_diagnosi_concomitante1{i},lista_senza_vuoti2)));
end
bar(frequenza_diagnosi_concomitante1,'g');
title('frequenza diagnosi concomitante1');
    
end
if selection==3
    lista_senza_vuoti3=DIAGNOSI_CONCOMITANTE2(~cellfun('isempty',DIAGNOSI_CONCOMITANTE2));
lista_diagnosi_concomitante2=unique(lista_senza_vuoti3);
frequenza_diagnosi_concomitante2=zeros(1,length(lista_diagnosi_concomitante2));
for i=1:length(lista_diagnosi_concomitante2)
    frequenza_diagnosi_concomitante2(i)=length(find(strcmp(lista_diagnosi_concomitante2{i},lista_senza_vuoti3)));
end

bar(frequenza_diagnosi_concomitante2,'r');
title('frequenza diagnosi concomitante2');

    
end
if selection==4
   
    lista_senza_vuoti4=DIAGNOSI_CONCOMITANTE3(~cellfun('isempty',DIAGNOSI_CONCOMITANTE3));
 lista_diagnosi_concomitante3=unique(lista_senza_vuoti4);
 frequenza_diagnosi_concomitante3=zeros(1,length(lista_diagnosi_concomitante3));
 for i=1:length(lista_diagnosi_concomitante3)
     frequenza_diagnosi_concomitante3(i)=length(find(strcmp(lista_diagnosi_concomitante3{i},lista_senza_vuoti4)));
 end

 bar(frequenza_diagnosi_concomitante3,'g');
 title('frequenza diagnosi concomitante3');
end
if selection==5
    
     title('frequenza diagnosi concomitante3');
lista_senza_vuoti5=DIAGNOSI_CONCOMITANTE4(~cellfun('isempty',DIAGNOSI_CONCOMITANTE4));
lista_diagnosi_concomitante4=unique(lista_senza_vuoti5);
frequenza_diagnosi_concomitante4=zeros(1,length(lista_diagnosi_concomitante4));
for i=1:length(lista_diagnosi_concomitante4)
    frequenza_diagnosi_concomitante4(i)=length(find(strcmp(lista_diagnosi_concomitante4{i},lista_senza_vuoti5)));
end

bar(frequenza_diagnosi_concomitante4,'r')
title('frequenza diagnosi concomitante4');

end

    

% --- Executes during object creation, after setting all properties.
function tag_diagnosi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tag_diagnosi (see GCBO)
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