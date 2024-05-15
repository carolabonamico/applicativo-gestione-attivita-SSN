function varargout = distribuzione_day_hospital(varargin)
% DISTRIBUZIONE_DAY_HOSPITAL MATLAB code for distribuzione_day_hospital.fig
%      DISTRIBUZIONE_DAY_HOSPITAL, by itself, creates a new DISTRIBUZIONE_DAY_HOSPITAL or raises the existing
%      singleton*.
%
%      H = DISTRIBUZIONE_DAY_HOSPITAL returns the handle to a new DISTRIBUZIONE_DAY_HOSPITAL or the handle to
%      the existing singleton*.
%
%      DISTRIBUZIONE_DAY_HOSPITAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISTRIBUZIONE_DAY_HOSPITAL.M with the given input arguments.
%
%      DISTRIBUZIONE_DAY_HOSPITAL('Property','Value',...) creates a new DISTRIBUZIONE_DAY_HOSPITAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before distribuzione_day_hospital_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to distribuzione_day_hospital_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help distribuzione_day_hospital

% Last Modified by GUIDE v2.5 29-Jan-2019 14:14:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @distribuzione_day_hospital_OpeningFcn, ...
                   'gui_OutputFcn',  @distribuzione_day_hospital_OutputFcn, ...
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


% --- Executes just before distribuzione_day_hospital is made visible.
function distribuzione_day_hospital_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to distribuzione_day_hospital (see VARARGIN)
assi = axes('unit', 'normalized', 'position', [0 0 1 1]);
sfondo = imread('blue.jpg');
imagesc(sfondo);
set(assi, 'handlevisibility', 'off', 'visible', 'off')
uistack(assi,'bottom')
set(gcf, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8])
% Choose default command line output for distribuzione_day_hospital
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes distribuzione_day_hospital wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = distribuzione_day_hospital_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in day_hos.
function day_hos_Callback(hObject, eventdata, handles)
% hObject    handle to day_hos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.grafico11)
  [ANNO,AZIENDA,ISTITUTO,DISCIPLINA_DIMISSIONE,PROGRESSIVO_REPARTO,REGIME_RICOVERO,PROVENIENZA,DRG,GIORNATE_DEGENZA,ACCESSI_IN_DH,IMPORTO_REGIONALE,DATA_DIMISSIONE,COMUNE_RESIDENZA,ETA,SESSO,DIAGNOSI_PRINCIPALE,DIAGNOSI_CONCOMITANTE1,DIAGNOSI_CONCOMITANTE2,DIAGNOSI_CONCOMITANTE3,DIAGNOSI_CONCOMITANTE4,INTERVENTO_PRINCIPALE,INTERVENTO_SECONDARIO1,INTERVENTO_SECONDARIO2,INTERVENTO_SECONDARIO3,INTERVENTO_SECONDARIO4,MODALITA_ACCESSO,MODALITA_DIMISSIONE,TIPO_DI_RICOVERO,DATA_INGRESSO,TIPO_PRESCRITTORE,CODICE_NOSOLOGICO]=textread('OSPEDALE4_Reg1.csv','%s%s%s%s%s%s%s%s%d%d%d%s%s%d%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s','delimiter',';');

conversione4=zeros(1,length(REGIME_RICOVERO));
for i=1:length(REGIME_RICOVERO)
conversione4(i)=str2num(REGIME_RICOVERO{i});
end
lista_day_hospital=DIAGNOSI_PRINCIPALE(conversione4==2);
lista_senza_vuoti_per_day_hospital=lista_day_hospital(~cellfun('isempty',lista_day_hospital));
diagnosi_principali_con_day_hospital=unique(lista_senza_vuoti_per_day_hospital);
distribuzione_day_hospital_per_diagnosi_principale=zeros(1,length(diagnosi_principali_con_day_hospital));
for i=1:length(diagnosi_principali_con_day_hospital)
distribuzione_day_hospital_per_diagnosi_principale(i)=length(find(strcmp(diagnosi_principali_con_day_hospital{i},lista_senza_vuoti_per_day_hospital)));
end

bar(distribuzione_day_hospital_per_diagnosi_principale,'r');
