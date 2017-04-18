function varargout = PlotGUI(varargin)
% PLOTGUI MATLAB code for PlotGUI.fig
%      PLOTGUI, by itself, creates a new PLOTGUI or raises the existing
%      singleton*.
%
%      H = PLOTGUI returns the handle to a new PLOTGUI or the handle to
%      the existing singleton*.
%
%      PLOTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTGUI.M with the given input arguments.
%
%      PLOTGUI('Property','Value',...) creates a new PLOTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PlotGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PlotGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PlotGUI

% Last Modified by GUIDE v2.5 18-Apr-2017 12:15:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PlotGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PlotGUI_OutputFcn, ...
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

function PlotGUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

handles.Data.MainGUI = varargin{1};

guidata(hObject, handles);

function varargout = PlotGUI_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function clearPlot_Callback(hObject, eventdata, handles)
axes(handles.axis);
cla;

function plotStyle_Callback(hObject, eventdata, handles)

function plotStyle_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

function debug_Callback(hObject, eventdata, handles)
keyboard

function figure1_CloseRequestFcn(hObject, eventdata, handles)
mainHandles = guidata(handles.Data.MainGUI);
mainHandles.Data.PlotGUI = [];
guidata(handles.Data.MainGUI,mainHandles);


delete(hObject);
