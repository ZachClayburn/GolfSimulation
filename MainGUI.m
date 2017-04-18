function varargout = MainGUI(varargin)
% MAINGUI MATLAB code for MainGUI.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainGUI

% Last Modified by GUIDE v2.5 17-Apr-2017 23:10:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MainGUI_OutputFcn, ...
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


% --- Executes just before MainGUI is made visible.
function MainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainGUI (see VARARGIN)

% Choose default command line output for MainGUI
handles.output = hObject;

handles.Data.PlotGui = [];

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in clubType.
function clubType_Callback(hObject, eventdata, handles)
% hObject    handle to clubType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns clubType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from clubType
list = cellstr(get(hObject,'String'));
index = get(hObject,'Value');

switch list{index}
    case 'Driver'
        toggleClubNumberMenu(handles, false());
    case 'Wood'
        toggleClubNumberMenu(handles, true(),list{index});
    case 'Iron'
        toggleClubNumberMenu(handles, true(),list{index});
    case 'Pitching Wedge'
        toggleClubNumberMenu(handles, false());
end


% --- Executes during object creation, after setting all properties.
function clubType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to clubType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function toggleClubNumberMenu(handles, isActive, varargin)

Wood = {'2','3','4','5','6','7'};
Iron = {'3','4','5','6','7','8','9'};

if isActive
    state = 'on';
    switch varargin{1}
        case 'Wood'
            string = Wood;
        case 'Iron'
            string = Iron;
    end
else
    state = 'off';
    string = 'N/A';
end
handles.clubNumber.Enable = state;
handles.clubNumber.Value = 1;
handles.clubNumber.String = string;



% --- Executes on selection change in clubNumber.
function clubNumber_Callback(hObject, eventdata, handles)
% hObject    handle to clubNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns clubNumber contents as cell array
%        contents{get(hObject,'Value')} returns selected item from clubNumber


% --- Executes during object creation, after setting all properties.
function clubNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to clubNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function powerSlider_Callback(hObject, eventdata, handles)
% hObject    handle to powerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

value = get(hObject,'Value');

handles.powerText.String = value;

% --- Executes during object creation, after setting all properties.
function powerSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to powerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function powerText_Callback(hObject, eventdata, handles)
% hObject    handle to powerText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of powerText as text
%        str2double(get(hObject,'String')) returns contents of powerText as a double

max= handles.powerSlider.Max;
min= handles.powerSlider.Min;

value = str2double(get(hObject,'String'));

if value > max
    value = max;
    %Add error message
elseif value < min
    value = min;
    %Add error message
end

handles.powerText.String = value;
handles.powerSlider.Value = value;

% guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function powerText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to powerText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function angleSlider_Callback(hObject, eventdata, handles)
% hObject    handle to angleSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(hObject,'Value');

handles.angleText.String = value;


% --- Executes during object creation, after setting all properties.
function angleSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angleSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function angleText_Callback(hObject, eventdata, handles)
% hObject    handle to angleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angleText as text
%        str2double(get(hObject,'String')) returns contents of angleText as a double
max= handles.angleSlider.Max;
min= handles.angleSlider.Min;

value = str2double(get(hObject,'String'));

if value > max
    value = max;
    %Add error message
elseif value < min
    value = min;
    %Add error message
end

handles.angleText.String = value;
handles.angleSlider.Value = value;

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function angleText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function windPowerSlider_Callback(hObject, eventdata, handles)
% hObject    handle to windPowerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject,'Value');

handles.windPowerText.String = value;

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function windPowerSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windPowerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function windPowerText_Callback(hObject, eventdata, handles)
% hObject    handle to windPowerText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
max= handles.windPowerSlider.Max;
min= handles.windPowerSlider.Min;

value = str2double(get(hObject,'String'));

if value > max
    value = max;
    %Add error message
elseif value < min
    value = min;
    %Add error message
end

handles.windPowerText.String = value;
handles.windPowerSlider.Value = value;

guidata(hObject,handles);

% Hints: get(hObject,'String') returns contents of windPowerText as text
%        str2double(get(hObject,'String')) returns contents of windPowerText as a double


% --- Executes during object creation, after setting all properties.
function windPowerText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windPowerText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function windAngleSlider_Callback(hObject, eventdata, handles)
% hObject    handle to windAngleSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject,'Value');

handles.windAngleText.String = value;

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function windAngleSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windAngleSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function windAngleText_Callback(hObject, eventdata, handles)
% hObject    handle to windAngleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
max= handles.windAngleSlider.Max;
min= handles.windAngleSlider.Min;

value = str2double(get(hObject,'String'));

if value > max
    value = max;
    %Add error message
elseif value < min
    value = min;
    %Add error message
end

handles.windAngleText.String = value;
handles.windAngleSlider.Value = value;

guidata(hObject,handles);

% Hints: get(hObject,'String') returns contents of windAngleText as text
%        str2double(get(hObject,'String')) returns contents of windAngleText as a double


% --- Executes during object creation, after setting all properties.
function windAngleText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windAngleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in multiPlot.
function multiPlot_Callback(hObject, eventdata, handles)
% hObject    handle to multiPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of multiPlot

val = get(hObject,'Value');

if val
   handles.plotCountMenu.Enable = 'on';
   handles.plotCountMenu.String = {'2','3','4','5','6'};
else
   handles.plotCountMenu.Enable = 'off';
   handles.plotCountMenu.String = '1';
   handles.plotCountMenu.Value = 1;
end


% --- Executes on selection change in plotCountMenu.
function plotCountMenu_Callback(hObject, eventdata, handles)
% hObject    handle to plotCountMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns plotCountMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plotCountMenu


% --- Executes during object creation, after setting all properties.
function plotCountMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotCountMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plotButton.
function plotButton_Callback(hObject, eventdata, handles)
% hObject    handle to plotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isempty(handles.Data.PlotGUI)
    handles.Data.PlotGUI = PlotGUI();
end
% keyboard
