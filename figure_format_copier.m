function varargout = figure_format_copier(varargin)
% FIGURE_FORMAT_COPIER MATLAB code for figure_format_copier.fig
%      FIGURE_FORMAT_COPIER, by itself, creates a new FIGURE_FORMAT_COPIER or raises the existing
%      singleton*.
%
%      H = FIGURE_FORMAT_COPIER returns the handle to a new FIGURE_FORMAT_COPIER or the handle to
%      the existing singleton*.
%
%      FIGURE_FORMAT_COPIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGURE_FORMAT_COPIER.M with the given input arguments.
%
%      FIGURE_FORMAT_COPIER('Property','Value',...) creates a new FIGURE_FORMAT_COPIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before figure_format_copier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to figure_format_copier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help figure_format_copier

% Last Modified by GUIDE v2.5 08-Aug-2018 16:12:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @figure_format_copier_OpeningFcn, ...
                   'gui_OutputFcn',  @figure_format_copier_OutputFcn, ...
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


% --- Executes just before figure_format_copier is made visible.
function figure_format_copier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to figure_format_copier (see VARARGIN)

% Choose default command line output for figure_format_copier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes figure_format_copier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = figure_format_copier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try 
    copys=str2double(get(handles.copy,'String'));
    intersect(findall(0,'type','figure'),copys);
   
    copy=figure(copys);
    YY=get(handles.checkbox4,'Value');
    if(YY) 
    figure(copys);
    yyaxis left
    end 
    copya= copy.CurrentAxes;

    
    colbar=copya.Colorbar;
    if isempty(colbar)
        disp(['==== Figure:',num2str(copys),' No Colorbar ====']); 
    else
    disp(['==== Figure:',num2str(copys),' Captured    ====']);
    pastes=str2double(get(handles.paste,'String'));
    B.Position=colbar.Position;
    
        try 
        intersect(findall(0,'type','figure'),pastes);
        paste=figure(pastes);
        catch
        paste=figure;  
        end
        set(handles.paste,'String',num2str(paste.Number));
        if(YY) 
        figure(paste.Number);
        yyaxis left
        end
        pastea= paste.CurrentAxes;
        cmap=get(copy,'Colormap');
        colormap(cmap);
        hc=pastea.Colorbar;
        
        NS=get(handles.checkbox1,'Value');
        CA=get(handles.checkbox2,'Value');
        
        if isempty(hc)
            if(NS)
                colorbar('north')
                hc=pastea.Colorbar;
            else
                colorbar('East')
                hc=pastea.Colorbar;
            end
        set(hc, 'Position',colbar.Position)
       % set(hc,'XAxisLocation',B.XAxisLocation);
        set(hc,'YAxisLocation',colbar.YAxisLocation);
        set(hc,'FontSize',colbar.FontSize);
        set(hc,'Color',colbar.Color);
       % hc=copyobj(copya,'Colorbar');
        else
             if(NS)
             set(hc, 'Location','north')
            else
        set(hc, 'Location','east')
             end
        set(hc, 'Position',colbar.Position)
        %set(hc,'XAxisLocation',B.XAxisLocation);
        set(hc,'YAxisLocation',colbar.YAxisLocation);
        set(hc,'FontSize',colbar.FontSize);
        set(hc,'Color',colbar.Color);
        if(CA)
        set(hc,'Limits',colbar.Limits);
        end
       
        
        
        
        
      %  hc=copyobj(copya,'Colorbar');
        end
        
        


        
 
    end
%     disp(['==== Figure:',num2str(copy),' Not a Figure ====']); 
   
   
catch
    %copy=str2double(get(handles.copy,'String'));
    disp(['==== Figure:',num2str(copys),' Not a Figure ====']);
end
   
    
    
   

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   
try 
    
    
    copys=str2double(get(handles.copy,'String'));
    intersect(findall(0,'type','figure'),copys);
    pastes=str2double(get(handles.paste,'String'));
    try 
    intersect(findall(0,'type','figure'),pastes);
    paste=figure(pastes);
    catch
    paste=figure;  
    end
    set(handles.paste,'String',num2str(paste.Number));

    
    copy=figure(copys);
    YY=get(handles.checkbox4,'Value');
    iter=0;
    iter=1+YY;
  for ii=1:iter
    figure(copys)
    if(YY)
    yyaxis left
    end
    if(ii>1)
    yyaxis right  
    end
    copya= copy.CurrentAxes;
    C.position=get(copy,'Position');C.position(1)=5; C.position(2)=5;
    C.units=get(copy,'Units');
    C.fcolo=get(copy,'color');
    C.Tickd=get(copya,'TickDir');
    C.Box=get(copya,'Box');
    C.fonts=get(copya,'fontsize');
    C.linew=get(copya,'linewidth');
    C.acolo=get(copya,'color');
    C.aYcolo=get(copya,'Ycolor');
    C.aXcolo=get(copya,'Xcolor');
    C.Ylabel=get(copya,'Ylabel');
    C.Xlabel=get(copya,'Xlabel');

    disp(['==== Figure:',num2str(copys),' Captured    ====']);
   
    figure(paste.Number)
    if(YY)
    yyaxis left
    end
    if(ii>1)
    yyaxis right  
    end
    pastea= paste.CurrentAxes;
    set(paste,'windowstyle','normal')
    set(paste,'PaperPositionMode','auto');
    set(paste,'Units',C.units)
    set(paste,'Position',C.position);
    set(paste,'color',C.fcolo);
    set(pastea,'TickDir',C.Tickd);
    axis tight;
    hold on;
    box(C.Box);
    set(pastea,'fontsize',C.fonts);
    set(pastea,'linewidth',C.linew);
    set(pastea,'color',C.acolo);
    set(pastea,'Ycolor',C.aYcolo);
    set(pastea,'Xcolor',C.aXcolo);
    set(pastea,'Position',copya.Position);
    
    xlabel(C.Xlabel.String,'Interpreter',C.Xlabel.Interpreter,'FontSize',C.Xlabel.FontSize);
    ylabel(C.Ylabel.String,'Interpreter',C.Ylabel.Interpreter,'FontSize',C.Ylabel.FontSize);

    LM=get(handles.checkbox3,'Value');
    
    if(LM)
    set(pastea,'XLim',copya.XLim);
    set(pastea,'YLim',copya.YLim);
    end
  end
   
%     disp(['==== Figure:',num2str(copy),' Not a Figure ====']); 
   
   
catch
    %copy=str2double(get(handles.copy,'String'));
    disp(['==== Figure:',num2str(copys),' Not a Figure ====']);
end

    




function copy_Callback(hObject, eventdata, handles)
% hObject    handle to copy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of copy as text
%        str2double(get(hObject,'String')) returns contents of copy as a double


% --- Executes during object creation, after setting all properties.
function copy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to copy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function paste_Callback(hObject, eventdata, handles)
% hObject    handle to paste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paste as text
%        str2double(get(hObject,'String')) returns contents of paste as a double


% --- Executes during object creation, after setting all properties.
function paste_CreateFcn(hObject, eventdata, handles)
% hObject    handle to paste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
clear all;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
