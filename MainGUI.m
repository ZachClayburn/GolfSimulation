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

% Last Modified by GUIDE v2.5 18-Apr-2017 12:14:34

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

function MainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

handles.Data.PlotGUI = [];

guidata(hObject, handles);

function varargout = MainGUI_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function clubType_Callback(hObject, eventdata, handles)
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


function clubType_CreateFcn(hObject, eventdata, handles)
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

function clubNumber_Callback(hObject, eventdata, handles)

function clubNumber_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function powerSlider_Callback(hObject, eventdata, handles)
value = get(hObject,'Value');

handles.powerText.String = value;

function powerSlider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function powerText_Callback(hObject, eventdata, handles)
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

function powerText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function angleSlider_Callback(hObject, eventdata, handles)
value = get(hObject,'Value');

handles.angleText.String = value;

function angleSlider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function angleText_Callback(hObject, eventdata, handles)
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

function angleText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function windPowerSlider_Callback(hObject, eventdata, handles)
value = get(hObject,'Value');

handles.windPowerText.String = value;

function windPowerSlider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function windPowerText_Callback(hObject, eventdata, handles)
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

function windPowerText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function windAngleSlider_Callback(hObject, eventdata, handles)
value = get(hObject,'Value');

handles.windAngleText.String = value;

function windAngleSlider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function windAngleText_Callback(hObject, eventdata, handles)
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

function windAngleText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function multiPlot_Callback(hObject, eventdata, handles)
val = get(hObject,'Value');

if val
   handles.plotCountMenu.Enable = 'on';
   handles.plotCountMenu.String = {'2','3','4','5','6'};
else
   handles.plotCountMenu.Enable = 'off';
   handles.plotCountMenu.String = '1';
   handles.plotCountMenu.Value = 1;
end


function plotCountMenu_Callback(hObject, eventdata, handles)

function plotCountMenu_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function R0 = getInitialValues(handles)

R0 = zeros(12,1);

clubString = handles.clubType.String;
clubT = clubString{handles.clubType.Value};
switch clubT
    case 'Driver'
        club = 'D';
    case 'Wood'
        numString = handles.clubNumber.String;
        clubNum = numString{handles.clubNumber.Value};
        club = strcat(clubNum,'W');
    case 'Iron'
        numString = handles.clubNumber.String;
        clubNum = numString{handles.clubNumber.Value};
        club = strcat(clubNum,'I');
    case 'Pitching Wedge'
        club = 'PW';
end
pwr = handles.powerSlider.Value;
[velocity,spin] = club_strike(club,pwr);
R0(4:6) = velocity;
R0(7:9) = spin;

windAngle = handles.windAngleSlider.Value;
windAngle = windAngle*pi/180;
windSpeed = handles.windPowerSlider.Value;

wind = zeros(3,1);
wind(1) = windSpeed * cos(windAngle);
wind(3) = windSpeed * sin(windAngle);
R0(10:12) = wind;


function plotButton_Callback(hObject, eventdata, handles)
if isempty(handles.Data.PlotGUI)
    [handles.Data.PlotGUI,handles.Data.addToPlot] = PlotGUI(hObject);
end

plotGUI = handles.Data.PlotGUI;
plotHandles = guidata(plotGUI);

R0 = getInitialValues(handles);
angle = handles.angleSlider.Value;
if handles.multiPlot.Value
    plotNum = handles.plotCountMenu.String{handles.plotCountMenu.Value};
else
    plotNum = 1;
end
handles.Data.addToPlot(R0,angle,plotNum,plotGUI,plotHandles)

% guidata(handles.Data.PlotGUI,plotHandles);
guidata(hObject,handles)

function debugButton_Callback(hObject, eventdata, handles)
keyboard


function figure1_CloseRequestFcn(hObject, eventdata, handles)
if ~isempty(handles.Data.PlotGUI)
   delete(handles.Data.PlotGUI);
end

delete(hObject);
