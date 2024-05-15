function varargout = Compartimenti(varargin)
% COMPARTIMENTI MATLAB code for Compartimenti.fig
%      COMPARTIMENTI, by itself, creates a new COMPARTIMENTI or raises the existing
%      singleton*.
%
%      H = COMPARTIMENTI returns the handle to a new COMPARTIMENTI or the handle to
%      the existing singleton*.
%
%      COMPARTIMENTI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARTIMENTI.M with the given input arguments.
%
%      COMPARTIMENTI('Property','Value',...) creates a new COMPARTIMENTI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Compartimenti_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Compartimenti_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Compartimenti

% Last Modified by GUIDE v2.5 29-Jan-2019 16:26:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Compartimenti_OpeningFcn, ...
                   'gui_OutputFcn',  @Compartimenti_OutputFcn, ...
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


% --- Executes just before Compartimenti is made visible.
function Compartimenti_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Compartimenti (see VARARGIN)

% Choose default command line output for Compartimenti
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Compartimenti wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Compartimenti_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in concentrazione_comp.
function concentrazione_comp_Callback(hObject, eventdata, handles)
% hObject    handle to concentrazione_comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[id_paz,A,a,b,valore_basale]=textread('parglucosio_ospedale_4.txt', ' %d %f %f %f %f', 'delimiter', '\t');
 global A_ode;
 global a_ode;
 global b_ode;
 A_ode=mean(A); 
 a_ode=mean(a);
 b_ode=mean(b);
 D=10000;
 V=(D*b_ode)/((b_ode-a_ode)*A_ode);
  
 [t,q]=ode23(@modello, [0 5], [D 0]);
 
 BG=q(:,2)/V;
 axes(handles.grafico2)
 plot(t,BG+mean(valore_basale));
 legend('concentrazione di glucosio nel compartimento plasmatico');
 xlabel('tempo[ore]');
 ylabel('concentrazione[mg/dl]');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[id_paz,A,a,b,valore_basale]=textread('parglucosio_ospedale_4.txt', ' %d %f %f %f %f', 'delimiter', '\t');

 global A_ode;
 global a_ode;
 global b_ode;
 A_ode=mean(A); 
 a_ode=mean(a);
 b_ode=mean(b);
 D=10000;
 V=(D*b_ode)/((b_ode-a_ode)*A_ode);
 
 [t,q]=ode23(@modello, [0 5], [D 0]);
 axes(handles.grafico3)
 plot(t,q(:,1),t,q(:,2));
 xlabel('tempo[ore]');
 ylabel('quantità[mg]');
 legend('quantità di glucosio nel cavo orale','quantità di glucosio nel compartimento plasmatico');


% --- Executes on button press in indietro.
function indietro_Callback(hObject, eventdata, handles)
% hObject    handle to indietro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
popup;
close(Compartimenti);