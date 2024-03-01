function varargout = control(varargin)
% CONTROL MATLAB code for control.fig
%      CONTROL, by itself, creates a new CONTROL or raises the existing
%      singleton*.
%
%      H = CONTROL returns the handle to a new CONTROL or the handle to
%      the existing singleton*.
%
%      CONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL.M with the given input arguments.
%
%      CONTROL('Property','Value',...) creates a new CONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before control_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to control_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help control

% Last Modified by GUIDE v2.5 21-Jan-2024 19:47:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @control_OpeningFcn, ...
                   'gui_OutputFcn',  @control_OutputFcn, ...
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


% --- Executes just before control is made visible.
function control_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to control (see VARARGIN)

% Choose default command line output for control
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes control wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = control_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global   controls q
slider_value = get(hObject,'Value');
set(controls.theta_1, 'String', num2str(slider_value));
q(1) = deg2rad(slider_value);
update_robot(handles);

    
    
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global  controls
controls.slider_q1=hObject;

set(hObject, 'Min',-180,'Max',180, 'Value',0,'SliderStep',[0.005 0.2]);

    

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global   controls q
slider_value = get(hObject,'Value');
set(controls.theta_2, 'String', num2str(slider_value));
q(2) = slider_value*pi/180;
update_robot(handles);

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Min',-90,'Max',50, 'Value',0,'SliderStep',[0.005 0.2]);

   global  controls
controls.slider_q2=hObject;

 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global   controls q
slider_value = get(hObject,'Value');
set(controls.theta_3, 'String', num2str(slider_value));
q(3) = slider_value*pi/180;
update_robot(handles);
% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Min',-180,'Max',75, 'Value',0,'SliderStep',[0.005 0.2]);

   global  controls
controls.slider_q3=hObject;

   
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global   controls q
slider_value = get(hObject,'Value');
set(controls.theta_4, 'String', num2str(slider_value));
q(4) = slider_value*pi/180;
update_robot(handles);% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Min',-400,'Max',400, 'Value',0,'SliderStep',[0.005 0.2]);
global  controls
controls.slider_q4=hObject;

 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global   controls q
slider_value = get(hObject,'Value');
set(controls.theta_5, 'String', num2str(slider_value));
q(5) = slider_value*pi/180;
update_robot(handles);
% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Min',-125,'Max',120, 'Value',0,'SliderStep',[0.005 0.2]);
global  controls
controls.slider_q5=hObject;

  
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global   controls q
slider_value = get(hObject,'Value');
set(controls.theta_6, 'String', num2str(slider_value));
q(6) = slider_value*pi/180;
update_robot(handles);
% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Min',-400,'Max',400, 'Value',0,'SliderStep',[0.005 0.2]);
global  controls
controls.slider_q6=hObject;

    
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global   controls q
slider_value = get(hObject,'Value');
set(controls.slider_1, 'String', num2str(slider_value));
q(1) = deg2rad(slider_value);
update_robot(handles);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global controls
controls.theta_1=hObject;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
global   controls q
slider_value = get(hObject,'Value');
set(controls.slider_2, 'String', num2str(slider_value));
q(1) = deg2rad(slider_value);
update_robot(handles);


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global controls
controls.theta_2=hObject;


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global   controls q
slider_value = get(hObject,'Value');
set(controls.slider_3, 'String', num2str(slider_value));
q(1) = deg2rad(slider_value);
update_robot(handles);


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global controls
controls.theta_3=hObject;

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
global   controls q
slider_value = get(hObject,'Value');
set(controls.slider_4, 'String', num2str(slider_value));
q(1) = deg2rad(slider_value);
update_robot(handles);


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global controls
controls.theta_4=hObject;


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
% --- Executes during object creation, after setting all properties.
global   controls q
slider_value = get(hObject,'Value');
set(controls.slider_5, 'String', num2str(slider_value));
q(1) = deg2rad(slider_value);
update_robot(handles);

function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global controls
controls.theta_5=hObject;



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
global   controls q
slider_value = get(hObject,'Value');
set(controls.slider_6, 'String', num2str(slider_value));
q(1) = deg2rad(slider_value);
update_robot(handles);


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global controls
controls.theta_6=hObject;
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
modelname = 'armrobot';

open_system(modelname);

set_param(modelname,'BlockReduction','on');
set_param(modelname,'StopTime','inf');
set_param(modelname,'SimulationMode','normal');

set_param(modelname,'StartFcn','1');
set_param(modelname,'SimulationCommand','start');
global q controls
t1 =0;
t2=0;
t3=0;
t4=0;
t5=0;
t6=0;
q = [t1,t2,t3,t4,t5,t6];
set_param([modelname '/gain1'],'Gain',num2str(t1))
set_param([modelname '/gain2'],'Gain',num2str(t2))
set_param([modelname '/gain3'],'Gain',num2str(t3))
set_param([modelname '/gain4'],'Gain',num2str(t4))
set_param([modelname '/gain5'],'Gain',num2str(t5))
set_param([modelname '/gain6'],'Gain',num2str(t6))
    
   T = dht(q);
    Px = T(1,4);
    Py = T(2,4);
    Pz = T(3,4);
    set(controls.px,'string',num2str(Px));
     set(controls.py,'string',num2str(Py));
      set(controls.pz,'string',num2str(Pz));
    set(controls.theta_1, 'String', num2str(q(1)));
    set(controls.theta_2, 'String', num2str(q(2)));
    set(controls.theta_3, 'String', num2str(q(3)));
    set(controls.theta_4, 'String', num2str(q(4)));
    set(controls.theta_5, 'String', num2str(q(5)));
    set(controls.theta_6, 'String', num2str(q(6)));
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
modelname = 'armrobot';
global var;

    t1 = 0;
    set(handles.edit1,'string',num2str(t1));
    set(handles.edit1,'value',t1);
    t2 = 0;
    set(handles.edit2,'string',num2str(t2));
    set(handles.edit2,'value',t2);
    t3 = 0;
    set(handles.edit3,'string',num2str(t3));
    set(handles.edit3,'value',t3);
     t4 = 0;
    set(handles.edit4,'string',num2str(t4));
    set(handles.edit4,'value',t4);
     t5 = 0;
    set(handles.edit6,'string',num2str(t5));
    set(handles.edit6,'value',t5);
     t6 = 0;
    set(handles.edit7,'string',num2str(t6));
    set(handles.edit7,'value',t6);
    
    
    set_param([modelname '/gain1'],'Gain',num2str(t1))
    set_param([modelname '/gain2'],'Gain',num2str(t2))
    set_param([modelname '/gain3'],'Gain',num2str(t3))
    set_param([modelname '/gain4'],'Gain',num2str(t4))
    set_param([modelname '/gain5'],'Gain',num2str(t5))
    set_param([modelname '/gain6'],'Gain',num2str(t6))
    q = [t1,t2,t3,t4,t5,t6];
    T = dht(q);
    Px = T(1,4);
    Py = T(2,4);
    Pz = T(3,4);
    set(handles.edit8,'string',num2str(Px));
     set(handles.edit9,'string',num2str(Py));
      set(handles.edit10,'string',num2str(Pz));

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global controls
controls.px=hObject;




function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global controls
controls.py=hObject;


function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global controls
controls.pz=hObject;


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function update_robot(handles)
global q controls
modelname = 'armrobot';


set_param([modelname '/gain1'],'Gain',num2str(q(1)))
set_param([modelname '/gain2'],'Gain',num2str(q(2)))
set_param([modelname '/gain3'],'Gain',num2str(q(3)))
set_param([modelname '/gain4'],'Gain',num2str(q(4)))
set_param([modelname '/gain5'],'Gain',num2str(q(5)))
set_param([modelname '/gain6'],'Gain',num2str(q(6)))
    
   T = dht(q);
    Px = T(1,4);
    Py = T(2,4);
    Pz = T(3,4);
    set(controls.px,'string',num2str(Px));
     set(controls.py,'string',num2str(Py));
      set(controls.pz,'string',num2str(Pz));
