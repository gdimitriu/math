function varargout = repartitions(varargin)
% REPARTITIONS M-file for repartitions.fig
%      REPARTITIONS, by itself, creates a new REPARTITIONS or raises the existing
%      singleton*.
%
%      H = REPARTITIONS returns the handle to a new REPARTITIONS or the handle to
%      the existing singleton*.
%
%      REPARTITIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REPARTITIONS.M with the given input arguments.
%
%      REPARTITIONS('Property','Value',...) creates a new REPARTITIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before repartitions_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to repartitions_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help repartitions

% Last Modified by GUIDE v2.5 21-Mar-2007 18:16:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @repartitions_OpeningFcn, ...
                   'gui_OutputFcn',  @repartitions_OutputFcn, ...
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


% --- Executes just before repartitions is made visible.
function repartitions_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to repartitions (see VARARGIN)

% Choose default command line output for repartitions
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes repartitions wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function X=uniform(N)
    X=rand(N,1);

function X=gauss(N)
    X=randn(N,1);

function X=poisson(N)
    X=randn(N,1);

function X=exponential(N)
    X=gen_expvect(N);

function X=erlang(N,k)
    X=zeros(1,N);
    for i=1:k
        X=X+gen_expvect(N);
    end

function X=center_hi2(N,f)
    R=randn(f,N);
    R=R.^2;
    X=sum(R);

function X=excentric_hi2(N,f,delta)
    R=randn(f,N);
    mean=1;
    sigma=delta/sqrt(f);
    R=1.+R.*sigma;
    R=R.^2;
    X=sum(R);

function X=center_student(N,f)
    Z=randn(1,N);
    hi=center_hi2(N,f);
    X=Z./sqrt(hi./f);

function X=excentric_student(N,f,delta)
    Z=randn(1,N);
    hi=excentric_hi2(N,f,delta);
    X=Z./sqrt(hi./f);

function X=center_snedecor(N,f1,f2)
    hi1=center_hi2(N,f1);
    hi2=center_hi2(N,f2);
    hi1=hi1./f1;
    hi2=hi2./f2;
    X=hi1./hi2;

function X=excentric_snedecor(N,f1,f2,d1,d2)
    if d1==0.0
        hi1=center_hi2(N,f1);
    else
        hi1=excentric_hi2(N,f1,d1);
    end
    if d2==0.0
        hi2=center_hi2(N,f2);
    else
        hi2=excentric_hi2(N,f2,d2);
    end
    hi1=hi1./f1;
    hi2=hi2./f2;
    X=hi1./hi2;
    
function X=lognormal(N,s,m)
    miu=log10(m)-log10(s/(m^2)+1);
    sigma=sqrt(log10(s/(m^2)+1));
    Z=randn(1,N);
    Y=miu+sigma.*Z;
    X=exp(Y);
% --- Outputs from this function are returned to the command line.
function varargout = repartitions_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function distrib_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distrib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in distrib.
function distrib_Callback(hObject, eventdata, handles)
% hObject    handle to distrib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns distrib contents as cell array
%        contents{get(hObject,'Value')} returns selected item from distrib
contents=get(hObject,'String');
handles.dist=contents(get(hObject,'Value'),:);
handles.type=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hist(handles.data);

% --- Executes on button press in generate.
function generate_Callback(hObject, eventdata, handles)
% hObject    handle to generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
average=str2double(get(handles.average,'String'));
variance=str2double(get(handles.variance,'String'));
nr_elem=str2double(get(handles.nr_elements,'String'));
lambda=str2double(get(handles.lambda,'String'));
delta1=str2double(get(handles.delta1,'String'));
delta2=str2double(get(handles.delta2,'String'));
if handles.type==1
    handles.data=feval(handles.dist{1},nr_elem);
    range=eval(get(handles.ranges,'String'));
    handles.data=range(1)+(range(2)-range(1))*handles.data;
elseif handles.type>1 && handles.type<4
    handles.data=feval(handles.dist{1},nr_elem);
    variance=sqrt(variance);
    handles.data=handles.data*variance+average;
elseif handles.type==4
    handles.data=feval(handles.dist{1},nr_elem);
    handles.data=handles.data/lambda;
elseif handles.type==5
    handles.data=feval(handles.dist{1},nr_elem,fix(lambda));
elseif handles.type==6 || handles.type==8
    handles.data=feval(handles.dist{1},nr_elem,fix(lambda));
elseif handles.type==7 || handles.type==9
    handles.data=feval(handles.dist{1},nr_elem,fix(variance),average);
elseif handles.type==10
    handles.data=feval(handles.dist{1},nr_elem,fix(variance),fix(average));
elseif handles.type==11
    handles.data=feval(handles.dist{1},nr_elem,fix(variance),fix(average),delta1,delta2);
elseif handles.type==12
    handles.data=feval(handles.dist{1},nr_elem,variance,average);
end
guidata(hObject,handles);
axes1_ButtonDownFcn(handles.axes1,eventdata,handles);
