function varargout = application(varargin)
% APPLICATION MATLAB code for application.fig
%      APPLICATION, by itself, creates a new APPLICATION or raises the
%      existing
%      singleton*.
%
%      H = APPLICATION returns the handle to a new APPLICATION or the handle to
%      the existing singleton*.
%
%      APPLICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPLICATION.M with the given input arguments.
%
%      APPLICATION('Property','Value',...) creates a new APPLICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before application_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to application_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help application

% Last Modified by GUIDE v2.5 02-Jun-2011 14:55:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @application_OpeningFcn, ...
                   'gui_OutputFcn',  @application_OutputFcn, ...
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


% --- Executes just before application is made visible.
function application_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to application (see VARARGIN)

% Choose default command line output for application
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes application wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = application_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editRepertoireAIndexer_Callback(hObject, eventdata, handles)
% hObject    handle to editRepertoireAIndexer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRepertoireAIndexer as text
%        str2double(get(hObject,'String')) returns contents of editRepertoireAIndexer as a double


% --- Executes during object creation, after setting all properties.
function editRepertoireAIndexer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRepertoireAIndexer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonRepertoireAIndexer.
function pushbuttonRepertoireAIndexer_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonRepertoireAIndexer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nomRepertoire=uigetdir('C:\','Choisir le répertoire des images');
%Si le choix est annulé
if nomRepertoire == 0 
    return; 
end
% Afficher le chemin du répertoire choisi
set(handles.editRepertoireAIndexer,'string',nomRepertoire);
% Lire les fichiers jpg
listeFiles=dir([nomRepertoire,'\*.jpg']);
%Si le repertoire est vide, afficher un msg d'erreur et quitter
if (length(listeFiles)==0) 
    msgbox('Aucune image n''a été trouvée dans l''emplacement choisi ! ','Vérifiez votre choix ');
    set(handles.editRepertoireAIndexer,'String','');
    return; 
end




function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function editImageRequete_Callback(hObject, eventdata, handles)
% hObject    handle to editImageRequete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editImageRequete as text
%        str2double(get(hObject,'String')) returns contents of editImageRequete as a double


% --- Executes during object creation, after setting all properties.
function editImageRequete_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editImageRequete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonImageRequete.
function pushbuttonImageRequete_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonImageRequete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[NomImage, Chemin, FILTERINDEX] = uigetfile('*.jpg','Choisir une image'); % Choisir une image
% Si aucun fichier n'est choisi
if (NomImage==0) 
    return; 
end 
set(handles.editImageRequete,'String',[Chemin,NomImage]);
image=imread([Chemin NomImage]);% lire l'image
axes(handles.axes1); % L'afficher
imshow(image);
set(handles.text13,'String',NomImage); % Afficher le nom





function editRepertoireDeRecherche_Callback(hObject, eventdata, handles)
% hObject    handle to editRepertoireDeRecherche (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRepertoireDeRecherche as text
%        str2double(get(hObject,'String')) returns contents of editRepertoireDeRecherche as a double


% --- Executes during object creation, after setting all properties.
function editRepertoireDeRecherche_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRepertoireDeRecherche (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonRepertoireDeRecherche.
function pushbuttonRepertoireDeRecherche_Callback(hObject, eventdata, handles)

folder=uigetdir('C:\','Choisir le répertoire des images');
if folder == 0 
    return; 
end
set(handles.editRepertoireDeRecherche,'String',folder);
% hObject    handle to pushbuttonRepertoireDeRecherche (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonIndexer.
function pushbuttonIndexer_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonIndexer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (isempty(get(handles.editRepertoireAIndexer,'String'))) 
    msgbox('Veuillez compléter les paramétres de l''indexation !','Informations requises ');
    return;
end
nomRepertoire= get(handles.editRepertoireAIndexer,'string');

%Si le répertoire choisi est déja indexé, notifier l'utilisateur
if (exist([nomRepertoire,'\index']))
    msgbox('Fichiers d''index existent déja dans l''emplacement choisi  !','Vérifiez votre choix');
    set(handles.edit_indexer,'String','');
    return;
end

indexer(nomRepertoire);




% --- Executes on button press in pushbuttonRechercher.
function pushbuttonRechercher_Callback(hObject, eventdata, handles)

nomImage=get(handles.editImageRequete,'String');
nomRepertoire=get(handles.editRepertoireDeRecherche,'String');
liste = rechercher(nomImage,nomRepertoire);

image1=imread([nomRepertoire,'\',liste(1).nom]);
axes(handles.axes2);
imshow(image1);
set(handles.text7,'String',liste(1).nom)

image2=imread([nomRepertoire,'\',liste(2).nom]);
axes(handles.axes3);
imshow(image2);
set(handles.text9,'String',liste(2).nom)

image3=imread([nomRepertoire,'\',liste(3).nom]);
axes(handles.axes4);
imshow(image3);
set(handles.text10,'String',liste(3).nom)

image4=imread([nomRepertoire,'\',liste(4).nom]);
axes(handles.axes5);
imshow(image4);
set(handles.text11,'String',liste(4).nom)

image5=imread([nomRepertoire,'\',liste(5).nom]);
axes(handles.axes6);
imshow(image5);
set(handles.text12,'String',liste(5).nom)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% hObject    handle to pushbuttonRechercher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
