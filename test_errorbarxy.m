     
% test errorbarxy
close all; clear all; clc
restoredefaultpath

x = linspace(0,2,20);
y = sin(2*pi*x);
dx = 0.1*ones(size(x));
dy = 0.3*ones(size(x));
plot(x,y,'.-k');
errorbarxy(x,y,dx,dy);

%% dx = []
close all
x = linspace(0,2,20);
y = sin(2*pi*x);
dy = 0.3*ones(size(x));
plot(x,y,'.-k');
errorbarxy(x,y,[],dy);

%% dy = []
close all
x = linspace(0,2,20);
y = sin(2*pi*x);
dx = 0.1*ones(size(x));
plot(x,y,'.-k');
errorbarxy(x,y,dx,[]);

%% assymmetric dx
close all; clear all
x = linspace(0,2,20);
y = sin(2*pi*x);
dx(:,1) = 0.1*ones(numel(x),1);
dx(:,2) = 0.3*ones(numel(x),1);
dy = 0.05*ones(size(x));
plot(x,y,'.-b');
errorbarxy(x,y,dx,dy);

%% assymmetric dy
close all; clear all
x = linspace(0,2,20);
y = sin(2*pi*x);
dy(:,1) = 0.1*ones(numel(x),1);
dy(:,2) = 0.3*ones(numel(x),1);
dx = 0.05*ones(size(x));
plot(x,y,'.-b');
errorbarxy(x,y,dx,dy);

%% nan values in dx
close all; clear all
x = linspace(0,2,20);
y = sin(2*pi*x);
dy(:,1) = 0.1*ones(numel(x),1);
dy(:,2) = 0.3*ones(numel(x),1);
dx = 0.05*ones(size(x));
dx(10) = NaN;
plot(x,y,'.-b');
errorbarxy(x,y,dx,dy);

%% nan values in dx and assymetric dy
close all; clear all
x = linspace(0,2,20);
y = sin(2*pi*x);
dy(:,1) = 0.1*ones(numel(x),1);
dy(:,2) = 0.3*ones(numel(x),1);
dx = 0.05*ones(size(x));
dx(10) = NaN;
dy(4,1) = NaN;
plot(x,y,'.-b');
errorbarxy(x,y,dx,dy);

%% Inf and Nan values in dx and assymetric dy
close all; clear all
x = linspace(0,2,20);
y = sin(2*pi*x);
dy(:,1) = 0.1*ones(numel(x),1);
dy(:,2) = 0.3*ones(numel(x),1);
dx = 0.05*ones(size(x));
dx(10) = NaN;
dx(12) = Inf;
dy(4,1) = NaN;
dy(10,2) = Inf;
plot(x,y,'.-b');
errorbarxy(x,y,dx,dy);

%% check linspec
close all; clear all
x = linspace(0,2,20);
y = sin(2*pi*x);
dy(:,1) = 0.1*ones(numel(x),1);
dy(:,2) = 0.3*ones(numel(x),1);
dx = 0.05*ones(size(x));
dx(10) = NaN;
dx(12) = Inf;
dy(4,1) = NaN;
dy(10,2) = Inf;
plot(x,y,'.-b');
errorbarxy(x,y,dx,dy,'-r','LineWidth',2);

%% check handle returns
close all; clear all; clc
x = linspace(0,2,20);
y = sin(2*pi*x);
dy(:,1) = 0.1*ones(numel(x),1);
dy(:,2) = 0.3*ones(numel(x),1);
dx = 0.05*ones(size(x));
plot(x,y,'.-b');
[hdx,hdy] = errorbarxy(x,y,dx,dy,'-r','LineWidth',2);
hdx(1).LineWidth = 10;
hdy(10).Color = 'green';



