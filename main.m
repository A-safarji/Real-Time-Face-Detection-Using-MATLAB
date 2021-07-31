function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%     Contributor: A.Safarji + Fahad 
%     MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 02-Jul-2020 15:40:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% standard size of image is 300 *300
global co
clc
warning off
st = version;
if str2double(st(1)) < 8 
    beep
    hx  = msgbox('PLEASE RUN IT ON MATLAB 2013 or Higher','INFO...!!!','warn','modal');
    pause(3)
    delete(hx)
    close(gcf)
    return
end
co = get(hObject,'color');
addpath(pwd,'database','codes')
if size(ls('database'),2) == 2
    delete('features.mat');
    delete('info.mat');
end
% Get default command line output from handles structure
varargout{1} = handles.output;







function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double



% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p  = get(handles.edit1,'UserData');
if strcmp(p,'000') == 1
    delete(hObject);
    delete(handles.pushbutton2)
    delete(handles.edit1);
    delete(handles.text2);
    delete(handles.text8);
    delete(handles.text3);
    delete(handles.text1);
    delete(handles.start);
    delete(handles.eyes);
    delete(handles.stop);
    delete(handles.upperbody);
    delete(handles.text7);
    delete(handles.axes6);
    
    %delete(handles.text4);
    msgbox('READ THE REPORT BEFORE STARTING','HELP....!!!','help','modal')
    set(handles.AD_NW_IMAGE,'enable','on')
    set(handles.DE_LETE,'enable','on')
    set(handles.TRAIN_ING,'enable','on')
    set(handles.STA_RT,'enable','on')
    set(handles.RESET_ALL,'enable','on')
    set(handles.EXI_T,'enable','on')
    set(handles.HE_LP,'enable','on')
    set(handles.DATA_BASE,'enable','on')
    set(handles.text5,'visible','on')
else
    msgbox('INVALID PASSWORD FRIEND... XX','WARNING....!!!','warn','modal')
    set(handles.edit1, 'String', ''); %to del
    
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close gcf



% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.vid = videoinput('winvideo' , 1, 'MJPG_1280x720');
preview(handles.vid);
guidata(hObject, handles);
 msgbox('This is just a quick test for your camera! And make sure to close this windwo for face detection, then reopen the whole app agin','WARNING....!!!','warn','modal')

triggerconfig(handles.vid ,'manual');
set(handles.vid, 'TriggerRepeat',inf);
set(handles.vid, 'FramesPerTrigger',1);
handles.vid.ReturnedColorspace = 'rgb';
 handles.vid.Timeout = 5;
start(handles.vid);
while(1)

facedetector = vision.CascadeObjectDetector;                                                 
trigger(handles.vid); 
handles.im = getdata(handles.vid, 1);
bbox = step(facedetector, handles.im);
hello = insertObjectAnnotation(handles.im,'rectangle',bbox,'Face');
imshow(hello);
end

function eyes_Callback(hObject, eventdata, handles)

handles.vid = videoinput('winvideo' , 1, 'MJPG_1280x720');
preview(handles.vid);
guidata(hObject, handles);
 msgbox('This is just a quick test for your camera! And make sure to close this windwo for eyes detection, then reopen the whole app agin','WARNING....!!!','warn','modal')


triggerconfig(handles.vid ,'manual');
set(handles.vid, 'TriggerRepeat',inf);
set(handles.vid, 'FramesPerTrigger',1);
handles.vid.ReturnedColorspace = 'rgb';
 handles.vid.Timeout = 2;
start(handles.vid);
while(1)
bodyDetector = vision.CascadeObjectDetector('EyePairBig');
bodyDetector.MinSize = [11 45]; 
%bodyDetector.ScaleFactor = 1.05;                                                 
trigger(handles.vid); 
handles.im = getdata(handles.vid, 1);
bbox = step(bodyDetector, handles.im);
hello = insertObjectAnnotation(handles.im,'rectangle',bbox,'EYE');
imshow(hello);
end
guidata(hObject, handles);

function upperbody_Callback(hObject, eventdata, handles)

handles.vid = videoinput('winvideo' , 1, 'MJPG_1280x720');
preview(handles.vid);
guidata(hObject, handles);
 msgbox('This is just a quick test for your camera! And make sure to close this windwo for upperbody detection, then reopen the whole app agin','WARNING....!!!','warn','modal')


triggerconfig(handles.vid ,'manual');
set(handles.vid, 'TriggerRepeat',inf);
set(handles.vid, 'FramesPerTrigger',1);
handles.vid.ReturnedColorspace = 'rgb';
 handles.vid.Timeout = 5;
start(handles.vid);
while(1)
bodyDetector = vision.CascadeObjectDetector('UpperBody');
bodyDetector.MinSize = [60 60]; 
bodyDetector.ScaleFactor = 1.05;                                                 
trigger(handles.vid); 
handles.im = getdata(handles.vid, 1);
bbox = step(bodyDetector, handles.im);
hello = insertObjectAnnotation(handles.im,'rectangle',bbox,'UpperBody');
imshow(hello);
end
guidata(hObject, handles);


% --------------------------------------------------------------------
function AD_NW_IMAGE_Callback(hObject, eventdata, handles)
% hObject    handle to AD_NW_IMAGE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function DE_LETE_Callback(hObject, eventdata, handles)
% hObject    handle to DE_LETE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function TRAIN_ING_Callback(hObject, eventdata, handles)
% hObject    handle to TRAIN_ING (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function STA_RT_Callback(hObject, eventdata, handles)
% hObject    handle to STA_RT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function DATA_BASE_Callback(hObject, eventdata, handles)
% hObject    handle to DATA_BASE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RESET_ALL_Callback(hObject, eventdata, handles)
% hObject    handle to RESET_ALL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EXI_T_Callback(hObject, eventdata, handles)
% hObject    handle to EXI_T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function HE_LP_Callback(hObject, eventdata, handles)
% hObject    handle to HE_LP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function READ_ME_Callback(hObject, eventdata, handles)
% hObject    handle to READ_ME (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('help.pdf')

% --------------------------------------------------------------------
function PRE_CAP_Callback(hObject, eventdata, handles)
% hObject    handle to PRE_CAP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if exist('features.mat','file') == 0
    msgbox('FIRST TRAIN YOUR DATABASE','INFO...!!!','MODAL')
    return
end
ff = dir('database');
if length(ff) == 2
    h = waitbar(0,'Plz wait Matlab is scanning ur database...','name','SCANNING IS IN PROGRESS');
    for k = 1:100
        waitbar(k/100)
        pause(0.03)
    end
    close(h)
    msgbox({'NO IMAGE FOUND IN DATABASE';'FIRST LOAD YOUR DATABASE';'USE ''ADD NEW IMAGE'' MENU'},'WARNING....!!!','WARN','MODAL')
    return
end
fd = vision.CascadeObjectDetector();
[f,p] = uigetfile('*.jpg','PLEASE SELECT AN FACIAL IMAGE');
if f == 0
    return
end
p1 = fullfile(p,f);
im = imread(p1);
bbox = step(fd, im);
vo = insertObjectAnnotation(im,'rectangle',bbox,'FACE');
r = size(bbox,1);
if isempty(bbox)
    axes(handles.axes1)
    imshow(vo);
    msgbox({'NO FACE IN THIS PIC';'PLEASE SELECT SINGLE FACE IMAGE'},'WARNING...!!!','warn','modal')
    uiwait
    cla(handles.axes1); reset(handles.axes1); set(handles.axes1,'box','on','xtick',[],'ytick',[])
    return
elseif r > 1
    axes(handles.axes1)
    imshow(vo);
    msgbox({'TOO MANY FACES IN THIS PIC';'PLEASE SELECT SINGLE FACE IMAGE'},'WARNING...!!!','warn','modal')
    uiwait
    cla(handles.axes1); reset(handles.axes1); set(handles.axes1,'box','on','xtick',[],'ytick',[])
    return
end
axes(handles.axes1)
image(vo);
set(handles.axes1,'xtick',[],'ytick',[],'box','on')
bx = questdlg({'CORRECT IMAGE IS SELECTED';'SELECT OPTION FOR FACE EXTRACTION'},'SELECT AN OPTION','MANUALLY','AUTO','CC');
if strcmp(bx,'MANUALLY') == 1
    while 1
        fhx = figure(2);
        set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
        imc = imcrop(im);
        bbox1 = step(fd, imc);
        if size(bbox1,1) ~= 1
            msgbox({'YOU HAVENT CROPED A FACE';'CROP AGAIN'},'BAD ACTION','warn','modal')
            uiwait
        else
            close gcf
            break
        end
        close gcf
    end
 imc = imresize(imc,[300  300]);
 image(imc)
 text(20,20,'\bfYour Precaptured image.','fontsize',12,'color','y','fontname','Times')
 set(handles.axes1,'xtick',[],'ytick',[],'box','on')
end
 if strcmp(bx,'AUTO') == 1
    imc = imcrop(im,[bbox(1)-50  bbox(2)-250   bbox(3)+100    bbox(4)+400]);
    fhx = figure(2);
    set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
    imshow(imc)
    qx = questdlg({'ARE YOU SATISFIED WITH THE RESULTS?';' ';'IF YES THEN PROCEED';' ';'IF NOT BETTER DO MANUAL CROPING'},'SELECT','PROCEED','MANUAL','CC');
    if strcmpi(qx,'proceed') == 1
        close gcf
        imc = imresize(imc,[300  300]);
        axes(handles.axes1)
        image(imc)
        text(20,20,'\bfYour Precaptured image.','fontsize',12,'color','y','fontname','Times')
        set(handles.axes1,'xtick',[],'ytick',[],'box','on')
    elseif strcmpi(qx,'manual') == 1
        while 1
            fhx = figure(2);
            set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
            imc = imcrop(im);
            bbox1 = step(fd, imc);
            if size(bbox1,1) ~= 1
                msgbox({'YOU HAVENT CROPED A FACE';'CROP AGAIN'},'BAD ACTION','warn','modal')
                uiwait
            else
                break
            end
            close gcf
        end
    close gcf
    imc = imresize(imc,[300 300]);
    axes(handles.axes1)
    image(imc)
    text(20,20,'\bfYour Precaptured image.','fontsize',12,'color','y','fontname','Times')
    set(handles.axes1,'xtick',[],'ytick',[],'box','on')
    else
    end
 end
 immxx = getimage(handles.axes1);
 zz = findsimilar(immxx);
 zz = strtrim(zz);
fxz = imread(['database/'  zz]);
q1= ehd(immxx,0.1);
q2 = ehd(fxz,0.1);
q3 = pdist([q1 ; q2]);
disp(q3)
if q3 < 0.5
    axes(handles.axes2)
    image(fxz)
    set(handles.axes1,'xtick',[],'ytick',[],'box','on')
    text(20,20,'\bfYour Database Entered Image.','fontsize',12,'color','y','fontname','comic sans ms')
    set(handles.axes2,'xtick',[],'ytick',[],'box','on')
    xs = load('info.mat');
    xs1 = xs.z2;
    for k = 1:length(xs1)
        st = xs1{k};
        stx = st{1};
        if strcmp(stx,zz) == 1
            str = st{2};
            break
        end
    end
    fid = fopen('attendence_sheet.txt','a');
    fprintf(fid,'%s              %s                %s                %s\r\n\n', 'Name','Date','Time', 'Attendence');
    c = clock;
    if c(4) > 12
        s = [num2str(c(4)-12) ,':',num2str(c(5)), ':', num2str(round(c(6))) ];
    else
        s = [num2str(c(4)) ,':',num2str(c(5)), ':', num2str(round(c(6))) ];
    end
    fprintf(fid,'%s          %s          %s                  %s\r\n\n', str, date,s,'Present');
    fclose(fid);
    set(handles.text5,'string',['Salam ' str ' ,your attendence has been checked.Thanks'])
    try
        s = serial('com22');
        fopen(s);
        fwrite(s,'A');
        pause(1)
        fclose(s);
        clear s
    catch
        msgbox({'PLZ CONNECT CABLE OR';'INVALID COM PORT SELECTED'},'WARNING','WARN','MODAL')
        uiwait 
        delete(s)
        clear s
    end
else
    msgbox('YOU ARE NOT A VALID PERSON', 'WARNING','WARN','MODAL')
    cla(handles.axes1)
    reset(handles.axes1)
    cla(handles.axes2)
    reset(handles.axes2)
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5);
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
end
    

% --------------------------------------------------------------------
function LIVE_CAM_Callback(hObject, eventdata, handles)
% hObject    handle to LIVE_CAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global co
if exist('features.mat','file') == 0
    msgbox('FIRST TRAIN YOUR DATABASE','INFO...!!!','MODAL')
    return
end
ff = dir('database');
if length(ff) == 2
    h = waitbar(0,'Plz wait Matlab is scanning ur database...','name','SCANNING IS IN PROGRESS');
    for k = 1:100
        waitbar(k/100)
        pause(0.03)
    end
    close(h)
    msgbox({'NO IMAGE FOUND IN DATABASE';'FIRST LOAD YOUR DATABASE';'USE ''ADD NEW IMAGE'' MENU'},'WARNING....!!!','WARN','MODAL')
    return
end

if isfield(handles,'vdx')
    vid = handles.vdx;
    stoppreview(vid)
    delete(vid)
    handles = rmfield(handles,'vdx');
    guidata(hObject,handles)
    cla(handles.axes1)
    reset(handles.axes1)
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
    cla(handles.axes2)
    reset(handles.axes2)
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
end
info = imaqhwinfo('winvideo');
did = info.DeviceIDs;
if isempty(did)
    msgbox({'YOUR SYSTEM DO NOT HAVE A WEBCAM';' ';'CONNECT A ONE'},'WARNING....!!!!','warn','modal')
    return
end
fd = vision.CascadeObjectDetector();
did = cell2mat(did);
for k = 1:length(did)
    devinfo = imaqhwinfo('winvideo',k);
    na(1,k) = {devinfo.DeviceName};
    sr(1,k) = {devinfo.SupportedFormats};
end
[a,b] = listdlg('promptstring','SELECT A WEB CAM DEVICE','liststring',na,'ListSize', [125, 75],'SelectionMode','single');
if b == 0
    return
end
if b ~= 0
    frmt = sr{1,a};
    [a1,b1] = listdlg('promptstring','SELECT RESOLUTION','liststring',frmt,'ListSize', [150, 100],'SelectionMode','single');
    if b1 == 0
        return
    end
end
frmt = frmt{a1};
l = find(frmt == '_');
res = frmt(l+1 : end);
l = find(res == 'x');
res1 = str2double(res(1: l-1));
res2 = str2double(res(l+1 : end));
axes(handles.axes1)
vid = videoinput('winvideo', a);
vr  =  [res1    res2];
nbands  =  get(vid,'NumberofBands');
h2im  = image(zeros([vr(2)  vr(1)  nbands] , 'uint8'));
preview(vid,h2im);
handles.vdx = vid;
guidata(hObject,handles)
tx = msgbox('PLZ STAND IN FRONT OF CAMERA STILL','INFO......!!!');
pause(1)
delete(tx)
kx  =  0;
while 1
    im = getframe(handles.axes1);
    im =  im.cdata;
    bbox = step(fd, im);
    vo = insertObjectAnnotation(im,'rectangle',bbox,'FACE');
    axes(handles.axes2)
    imshow(vo)
    if size(bbox,1) > 1
        msgbox({'TOO MANY FACES IN FRAME';' ';'ONLY ONE FACE IS ACCEPTED'},'WARNING.....!!!','warn','modal')
        uiwait
        stoppreview(vid)
        delete(vid)
        handles = rmfield(handles,'vdx');
        guidata(hObject,handles)
        cla(handles.axes1)
        reset(handles.axes1)
        set(handles.axes1,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
        cla(handles.axes2)
        reset(handles.axes2)
        set(handles.axes2,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
        return
    end
    kx = kx + 1;
    if kx > 10 && ~isempty(bbox)
        break
    end
end
imc = imcrop(im,[bbox(1)+3    bbox(2)-35    bbox(3)-10      bbox(4)+70]);
imx  =   imresize(imc,[300  300]);
axes(handles.axes1)
image(imx)
text(20,20,'\bfYour image is correct.','fontsize',13,'color','b','fontname','Times')
set(handles.axes1,'xtick',[],'ytick',[],'box','on')
 immxx = imx;
 zz = findsimilar(immxx);
 zz = strtrim(zz);
fxz = imread(['database/'  zz]);
q1= ehd(immxx,0.1);
q2 = ehd(fxz,0.1);
q3 = pdist([q1 ; q2]);
disp(q3)
if q3 < 0.5
    axes(handles.axes2)
    image(fxz)
    set(handles.axes1,'xtick',[],'ytick',[],'box','on')
    text(20,20,'\bfUr Database Entered Image.','fontsize',12,'color','y','fontname','Timess')
    set(handles.axes2,'xtick',[],'ytick',[],'box','on')
    xs = load('info.mat');
    xs1 = xs.z2;
    for k = 1:length(xs1)
        st = xs1{k};
        stx = st{1};
        if strcmp(stx,zz) == 1
            str = st{2};
            break
        end
    end
    fid = fopen('attendence_sheet.txt','a');
    fprintf(fid,'%s              %s                %s                %s\r\n\n', 'Name','Date','Time', 'Attendence');
    c = clock;
    if c(4) > 12
        s = [num2str(c(4)-12) ,':',num2str(c(5)), ':', num2str(round(c(6))) ];
    else
        s = [num2str(c(4)) ,':',num2str(c(5)), ':', num2str(round(c(6))) ];
    end
    fprintf(fid,'%s          %s          %s                  %s\r\n\n', str, date,s,'Present');
    fclose(fid);
    set(handles.text5,'string',['Salam ' str ' ,your attendence has been checked.Thanks!'])
    try
        s = serial('com22');
        fopen(s);
        fwrite(s,'A');
        pause(1)
        fclose(s);
        clear s
    catch
        msgbox({'U CAN CONNECT CABLE OR';'INVALID COM PORT SELECTED'},'WARNING','WARN','MODAL')
        uiwait 
        delete(s)
        clear s
    end
else
    msgbox('YOU ARE NOT A VALID PERSON', 'WARNING','WARN','MODAL')
    cla(handles.axes1)
    reset(handles.axes1)
    cla(handles.axes2)
    reset(handles.axes2)
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5);
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
end
% --------------------------------------------------------------------
function SINGL_PIC_Callback(hObject, eventdata, handles)
% hObject    handle to SINGL_PIC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flist  =  dir('database');
if length(flist) == 2
    msgbox('NOTHING TO DELETE','INFO','modal');
    return
end
cd('database')
[f,p] = uigetfile('*.jpg','SELECT A PIC TO DELETE IT');
if f == 0
    cd ..
    return
end
p1 = fullfile(p,f);
delete(p1)
flist  =  dir(pwd);
if length(flist) == 2
    cd ..
    return
end
for k =  3:length(flist)
    z = flist(k).name;
    z(strfind(z,'.') : end) = [];
    nlist(k-2) = str2double(z);
end
nlist  = sort(nlist);
h = waitbar(0,'PLZ WAIT, WHILE MATLAB IS RENAMING','name','PROGRESS...');
for k = 1:length(nlist)
    if k ~= nlist(k)
        p = nlist(k);
        movefile([num2str(p)  '.jpg']  ,  [num2str(k)  '.jpg'])
        waitbar((k-2)/length(flist),h,sprintf('RENAMED  %s   to  %s',[num2str(p)  '.jpg'],[num2str(k)  '.jpg']))
    end
    pause(.5)
end
close(h)
cd ..


% --------------------------------------------------------------------
function MULTI_PIC_Callback(hObject, eventdata, handles)
% hObject    handle to MULTI_PIC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flist  =  dir('database');
if length(flist) == 2
    msgbox('NOTHING TO DELETE','INFO','modal');
    return
end
for k =  3:length(flist)
    na1(k-2,1) = {flist(k).name};
end
[a,b] = listdlg('promptstring','SELECT FILE/FILES TO DELETE','liststring',na1,'listsize',[125  100]);
if b == 0
    return
end
cd ('database')
for k = 1:length(a)
    str = na1{k};
    delete(str)
end
cd ..
flist  =  dir('database');
if length(flist) == 2
    msgbox({'NOTHING TO RENAME';'ALL DELETED'},'INFO','modal');
    return
end
cd('database')
flist  =  dir(pwd);
for k =  3:length(flist)
    z = flist(k).name;
    z(strfind(z,'.') : end) = [];
    nlist(k-2) = str2double(z);
end
nlist  = sort(nlist);
h = waitbar(0,'PLZ WAIT, WHILE MATLAB IS RENAMING','name','PROGRESS...');
for k = 1:length(nlist)
    if k ~= nlist(k)
        p = nlist(k);
        movefile([num2str(p)  '.jpg']  ,  [num2str(k)  '.jpg'])
        waitbar((k-2)/length(flist),h,sprintf('RENAMED  %s   to  %s',[num2str(p)  '.jpg'],[num2str(k)  '.jpg']))
    end
    pause(.5)
end
close(h)
cd ..


% --------------------------------------------------------------------
function BR_OWSE_Callback(hObject, eventdata, handles)
% hObject    handle to BR_OWSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,p] = uigetfile('*.jpg','PLEASE SELECT AN FACIAL IMAGE');
if f == 0
    return
end
p1 = fullfile(p,f);
im = imread(p1);
fd = vision.CascadeObjectDetector();
bbox = step(fd, im);
vo = insertObjectAnnotation(im,'rectangle',bbox,'FACE');
r = size(bbox,1);
if isempty(bbox)
    fhx = figure(2);
    set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
    imshow(vo);
    msgbox({'WHAT HAVE U CHOOSEN?';'NO FACE FOUND IN THIS PIC,';'SELECT SINGLE FACE IMAGE.'},'WARNING...!!!','warn','modal')
    uiwait
    delete(fhx)
    return
elseif r > 1
    fhx = figure(2);
    set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
    imshow(vo);
    msgbox({'TOO MANY FACES IN THIS PIC';'PLEASE SELECT SINGLE FACE IMAGE'},'WARNING...!!!','warn','modal')
    uiwait
    delete(fhx)
    return
end
bx = questdlg({'CORRECT IMAGE IS SELECTED';'SELECT OPTION FOR FACE EXTRACTION'},'SELECT AN OPTION','MANUALLY','AUTO','CC');
if strcmp(bx,'MANUALLY') == 1
    while 1
        fhx = figure(2);
        set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
        imc = imcrop(im);
        bbox1 = step(fd, imc);
        if size(bbox1,1) ~= 1
            msgbox({'YOU HAVENT CROPED A FACE';'CROP AGAIN'},'BAD ACTION','warn','modal')
            uiwait
        else
            break
        end
        close gcf
    end
    close gcf
    imc = imresize(imc,[300  300]);
    cd ('database');
    l = length(dir(pwd));
    n = [int2str(l-1)    '.jpg'];
    imwrite(imc,n);
    cd ..
    while 1
        qq = inputdlg('WHAT IS UR NAME?','FILL');
        if isempty(qq)
            msgbox({'YOU HAVE TO ENTER A NAME';' ';'YOU CANT CLICK CANCEL'},'INFO','HELP','MODAL')
            uiwait
        else
            break
        end
    end
    qq = qq{1};
    if exist('info.mat','file') == 2
        load ('info.mat')
        r = size(z2,1);
        z2{r+1,1} = {n , qq};
        save('info.mat','z2')
    else
        z2{1,1} = {n,qq};
        save('info.mat','z2')
    end
end
if strcmp(bx,'AUTO') == 1
    imc = imcrop(im,[bbox(1)-50  bbox(2)-250   bbox(3)+100    bbox(4)+400]);
    fhx = figure(2);
    set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
    imshow(imc)
    qx = questdlg({'ARE YOU SATISFIED WITH THE RESULTS?';' ';'IF YES THEN PROCEED';' ';'IF NOT BETTER DO MANUAL CROPING'},'SELECT','PROCEED','MANUAL','CC');
    if strcmpi(qx,'proceed') == 1
        imc = imresize(imc,[300  300]);
        cd ('database');
        l = length(dir(pwd));
        n = [int2str(l-1)    '.jpg'];
        imwrite(imc,n);
        cd ..
        while 1
        qq = inputdlg('WHAT IS UR NAME?','FILL');
        if isempty(qq)
            msgbox({'YOU HAVE TO ENTER A NAME';' ';'YOU CANT CLICK CANCEL'},'INFO','HELP','MODAL')
            uiwait
        else
            break
        end
        end
        qq = qq{1};
    if exist('info.mat','file') == 2
        load ('info.mat')
        r = size(z2,1);
        z2{r+1,1} = {n , qq};
        save('info.mat','z2')
    else
        z2{1,1} = {n,qq};
        save('info.mat','z2')
    end
    close gcf
    elseif strcmpi(qx,'manual') == 1
        while 1
            fhx = figure(2);
            set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
            imc = imcrop(im);
            bbox1 = step(fd, imc);
            if size(bbox1,1) ~= 1
                msgbox({'YOU HAVENT CROPED A FACE';'CROP AGAIN'},'BAD ACTION','warn','modal')
                uiwait
            else
                break
            end
            close gcf
        end
    close gcf
    imc = imresize(imc,[300  300]);
    cd ('database');
    l = length(dir(pwd));
    n = [int2str(l-1)    '.jpg'];
    imwrite(imc,n);
    cd ..
    while 1
        qq = inputdlg('WHAT IS UR NAME?','FILL');
        if isempty(qq)
            msgbox({'YOU HAVE TO ENTER A NAME';' ';'YOU CANT CLICK CANCEL'},'INFO','HELP','MODAL')
            uiwait
        else
            break
        end
    end
    qq = qq{1};
    if exist('info.mat','file') == 2
        load ('info.mat')
        r = size(z2,1);
        z2{r+1,1} = {n , qq};
        save('info.mat','z2')
    else
        z2{1,1} = {n,qq};
        save('info.mat','z2')
    end
    else
        return
    end
end


% --------------------------------------------------------------------
function FRM_CAM_Callback(hObject, eventdata, handles)
% hObject    handle to FRM_CAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global co
if isfield(handles,'vdx')
    vid = handles.vdx;
    stoppreview(vid)
    delete(vid)
    handles = rmfield(handles,'vdx');
    guidata(hObject,handles)
    cla(handles.axes1)
    reset(handles.axes1)
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
    cla(handles.axes2)
    reset(handles.axes2)
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
end
fd = vision.CascadeObjectDetector();
info = imaqhwinfo('winvideo');
did = info.DeviceIDs;
if isempty(did)
    msgbox({'YOUR SYSTEM DO NOT HAVE A WEBCAM';' ';'CONNECT A ONE'},'WARNING....!!!!','warn','modal')
    return
end
did = cell2mat(did);
for k = 1:length(did)
    devinfo = imaqhwinfo('winvideo',k);
    na(1,k) = {devinfo.DeviceName};
    sr(1,k) = {devinfo.SupportedFormats};
end
[a,b] = listdlg('promptstring','SELECT A WEB CAM DEVICE','liststring',na,'ListSize', [125, 75],'SelectionMode','single');
if b == 0
    return
end
if b ~= 0
    frmt = sr{1,a};
    [a1,b1] = listdlg('promptstring','SELECT RESOLUTION','liststring',frmt,'ListSize', [150, 100],'SelectionMode','single');
    if b1 == 0
        return
    end
end
frmt = frmt{a1};
l = find(frmt == '_');
res = frmt(l+1 : end);
l = find(res == 'x');
res1 = str2double(res(1: l-1));
res2 = str2double(res(l+1 : end));
axes(handles.axes1)
vid = videoinput('winvideo', a);
vr  =  [res1    res2];
nbands  =  get(vid,'NumberofBands');
h2im  = image(zeros([vr(2)  vr(1)  nbands] , 'uint8'));
preview(vid,h2im);
handles.vdx = vid;
guidata(hObject,handles)
tx = msgbox('PLZ STAND IN FRONT OF CAMERA STILL','INFO......!!!');
pause(1)
delete(tx)
kx  =  0;
while 1
    im = getframe(handles.axes1);
    im =  im.cdata;
    bbox = step(fd, im);
    vo = insertObjectAnnotation(im,'rectangle',bbox,'FACE');
    axes(handles.axes2)
    imshow(vo)
    if size(bbox,1) > 1
        msgbox({'TOO MANY FACES IN FRAME';' ';'ONLY ONE FACE IS ACCEPTED'},'WARNING.....!!!','warn','modal')
        uiwait
        stoppreview(vid)
        delete(vid)
        handles = rmfield(handles,'vdx');
        guidata(hObject,handles)
        cla(handles.axes1)
        reset(handles.axes1)
        set(handles.axes1,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
        cla(handles.axes2)
        reset(handles.axes2)
        set(handles.axes2,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
        return
    end
    kx = kx + 1;
    if kx > 10 && ~isempty(bbox)
        break
    end
end
imc = imcrop(im,[bbox(1)+3    bbox(2)-35    bbox(3)-10      bbox(4)+70]);
imx  =   imresize(imc,[300  300]);
fhx = figure(2);
set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
imshow(imx)
cd ('database');
l = length(dir(pwd));
n = [int2str(l-1)    '.jpg'];
imwrite(imx,n);
cd ..
    while 1
        qq = inputdlg('WHAT IS UR NAME?','FILL');
        if isempty(qq)
            msgbox({'YOU HAVE TO ENTER A NAME';' ';'YOU CANT CLICK CANCEL'},'INFO','HELP','MODAL')
            uiwait
        else
            break
        end
    end
    qq = qq{1};
    if exist('info.mat','file') == 2
        load ('info.mat')
        r = size(z2,1);
        z2{r+1,1} = {n , qq};
        save('info.mat','z2')
    else
        z2{1,1} = {n,qq};
        save('info.mat','z2')
    end
close gcf
stoppreview(vid)
delete(vid)
handles = rmfield(handles,'vdx');
guidata(hObject,handles)
cla(handles.axes1)
reset(handles.axes1)
set(handles.axes1,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
cla(handles.axes2)
reset(handles.axes2)
set(handles.axes2,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)


% --- Executes on key press with focus on edit1 and none of its controls.
function edit1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
pass = get(handles.edit1,'UserData');
v = double(get(handles.figure1,'CurrentCharacter'));
if v == 8
    pass = pass(1:end-1);
    set(handles.edit1,'string',pass)
elseif any(v == 65:90) || any(v  == 97:122) || any(v == 48:57)
    pass = [pass  char(v)];
elseif v == 13
    p  = get(handles.edit1,'UserData');
    if strcmp(p,'000') == true
        delete(hObject);
        delete(handles.pushbutton2)
        delete(handles.pushbutton1);
        delete(handles.text2);
        delete(handles.axes6);
        delete(handles.text3);
        delete(handles.text7);
        delete(handles.text8);
        delete(handles.text1);
        delete(handles.start);
        delete(handles.stop);
        delete(handles.eyes);
        delete(handles.upperbody);
        %delete(handles.text4);
        msgbox('READ THE REPORT BEFORE STARTING AND MAKE SURE TO START PIC TRAINING','HELP!','help','modal')
        set(handles.AD_NW_IMAGE,'enable','on')
        set(handles.DE_LETE,'enable','on')
        set(handles.TRAIN_ING,'enable','on')
        set(handles.STA_RT,'enable','on')
        set(handles.RESET_ALL,'enable','on')
        set(handles.EXI_T,'enable','on')
        set(handles.HE_LP,'enable','on')
        set(handles.DATA_BASE,'enable','on')
        set(handles.text5,'visible','on')
        return
    else
        beep
        msgbox('INVALID PASSWORD FRIEND... XX','WARNING....!!!','warn','modal')
        uiwait;
        set(handles.edit1,'string','')
        
        return
    end
else
    msgbox({'Invalid Password Character';'Can''t use Special Character'},'warn','modal')
    uiwait;
    set(handles.edit1,'string','')
  
    return
end
set(handles.edit1,'UserData',pass)
set(handles.edit1,'String',char('*'*sign(pass)))


% --------------------------------------------------------------------
function VI_EW_Callback(hObject, eventdata, handles)
% hObject    handle to VI_EW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

f = dir('database');
if length(f) == 2
    msgbox('YOUR DATA BASE HAS NO IMAGE TO DISPLAY','SORRY','modal')
    return
end
l = length(f)-2;
while 1
    a = factor(l);
    if length(a) >= 4
        break
    end
    l = l+1;
end
d  = a(1: ceil(length(a)/2));
d = prod(d);
d1 = a(ceil(length(a)/2)+1  : end);
d1 = prod(d1);
zx = sort([d d1]);
figure('menubar','none','numbertitle','off','name','Images of Database','color',[0.0431  0.5176  0.7804],'position',[300 200 600 500])
for k = 3:length(f)
    im = imread(f(k).name);
    subplot(zx(1),zx(2),k-2)
    imshow(im)
    title(f(k).name,'fontsize',10,'color','w')
end



% --------------------------------------------------------------------
function Start_Training_Callback(hObject, eventdata, handles)
% hObject    handle to Start_Training (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ff = dir('database');
if length(ff) == 2
    h = waitbar(0,'Plz wait Matlab is scanning ur database...','name','SCANNING IS IN PROGRESS');
    for k = 1:100
        waitbar(k/100)
        pause(0.03)
    end
    close(h)
    msgbox({'NO IMAGE FOUND IN DATABASE';'FIRST LOAD YOUR DATABASE';'USE ''ADD NEW IMAGE'' MENU'},'WARNING....!!!','WARN','MODAL')
    return
end
if exist('features.mat','file') == 2
    bx = questdlg({'TRAINING HAS ALREDY BEEN DONE';' ';'WANT TO TRAIN DATABASE AGAIN?'},'SELECT','YES','NO','CC');
    if strcmpi(bx,'yes') == 1
        builddatabase
        msgbox('TRAINING DONE....PRESS OK TO CONTINUE','OK','modal')
        return
    else
        return
    end
else
    builddatabase
    msgbox('TRAINING DONE....PRESS OK TO CONTINUE','OK','modal')
    return
end


% --------------------------------------------------------------------
function BYE_Callback(hObject, eventdata, handles)
% hObject    handle to BYE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close gcf


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --------------------------------------------------------------------
function ATTENDENCE_Callback(hObject, eventdata, handles)
% hObject    handle to ATTENDENCE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if  exist('attendence_sheet.txt','file') == 2
    winopen('attendence_sheet.txt')
else
    msgbox('NO ATTENDENCE SHEET TO DISPLAY','INFO...!!!','HELP','MODAL')
end

% --------------------------------------------------------------------
function DEL_ATTENDENCE_Callback(hObject, eventdata, handles)
% hObject    handle to DEL_ATTENDENCE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if  exist('attendence_sheet.txt','file') == 2
   delete('attendence_sheet.txt')
   msgbox('ATTENDENCE DELETED','INFO...!!!','MODAL')
else
    msgbox('NO ATTENDENCE SHEET TO DELETE','INFO...!!!','HELP','MODAL')
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x  = questdlg({'Resetting will Clear the followings: ';'1. Attendence_sheet';'2. Database';'3. features.mat';'4. Info.mat';'Do u want to continue?'},'Please select...!!');
if strcmpi(x,'yes') == 1
    delete('attendence_sheet.txt')
    delete('features.mat')
    delete('info.mat')
    cd ([pwd, '\database'])
    f = dir(pwd);
    for k = 1:length(f)
        delete(f(k).name)
    end
    cd .. 
    cla(handles.axes1);
    reset(handles.axes1);
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
    cla(handles.axes2);
    reset(handles.axes2);
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.804],'linewidth',1.5)
    set(handles.text5,'string','')
    beep
    msgbox('All Reset','Info','modal')
end


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);
reset(handles.axes1);
set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
cla(handles.axes2);
reset(handles.axes2);
set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
set(handles.text5,'string','')


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in start.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stop.
%function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
stop(handles.vid),clear handles.vid %, ,delete(handles.vid)
guidata(hObject, handles);
