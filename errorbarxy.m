function [hdx,hdy] = errorbarxy(varargin)
%   errorbarxy(x,y,dx,dy) plots horizontal and vertical error bars at
%   (x,y). x and y must be vectors of the same length. If dx is a scalar,
%   errorbarxy plots symmetric error bars from x-dx to x+dx for each x. If
%   dx is a vector, each x will have different, but symmetric error bars.
%   If dx is an array with 2 columns or 2 rows, the lower deviation is
%   specified by the first row or column, and the upper deviation by the
%   second. No errors will be plotted for x if dx = []. NaN and Inf values
%   are treated as zeros. dy has the same behavior as dx
%   applied to y.
%
%   errorbarxy(...,'LineSpec') uses the color and linestyle specified by
%   the string 'LineSpec' to plot the error bars. Any markers will be
%   applied to the ends of the error bars.
%
%   errorbarxy(AX,...) plots into AX instead of GCA.
%
%   [hdx,hdy] = errorbarxy(...) returns a vectors of line handles for x
%   error bars and y error bars.
%
%   For example,
%     x = linspace(0,2,20);
%     y = sin(2*pi*x);
%     dx = 0.1*ones(size(x));
%     dy = 0.3*ones(size(x));
%     plot(x,y,'.-k');
%     errorbarxy(x,y,dx,dy);
%   draws symmetric error bars around x and y
%
%   Note. Error bars are moved to the bottom layer, as this is usually the
%   desired behavior. Apply uistack to hdx and/or hdy to change this.
%
%   Christopher Thissen (cthissen@gmail.com)
%   Yale University
%   Jan 28, 2016
%   
%% parse and check inputs
narginchk(4,inf);

% check if first input is axes handle
handleCheck = ishandle(varargin{1});
if handleCheck
    % first input is axes handle
    hAx = varargin{1};
    x   = varargin{2};
    y   = varargin{3};
    dx  = varargin{4};
    dy  = varargin{5};  
    % set default plot options
    if nargin == 5
        plotAttributes = {'-k','LineWidth',1};
    else 
        plotAttributes = varargin(6:nargin);
    end
    
else
    hAx = gca;
    hold(hAx,'on');
    x  = varargin{1};
    y  = varargin{2};
    dx = varargin{3};
    dy = varargin{4};
    % set default plot options
    if nargin == 4
        plotAttributes = {'-k','LineWidth',1};
    else
        plotAttributes = varargin(5:nargin);
    end
    
end
  
validateattributes(x,{'numeric'},{'vector'});
validateattributes(y,{'numeric'},{'vector'});
validateattributes(dx,{'numeric'},{'real','nonnegative'});
validateattributes(dy,{'numeric'},{'real','nonnegative'});

[nrowdx,ncoldx] = size(dx);
if ncoldx == 1 || nrowdx == 1
    % symmetric errors in x
    dx = dx(:);
    dx(:,2) = dx(:,1);
elseif isempty(dx)
    dx(:,1) = 0*ones(size(x));
    dx(:,2) = dx(:,1);
end
[nrowdy,ncoldy] = size(dy);
if ncoldy == 1 || nrowdy == 1
    % symmetric errors in y
    dy = dy(:);
    dy(:,2) = dy(:,1);
elseif isempty(dy)
    dy(:,1) = 0*ones(size(x));
    dy(:,2) = dy(:,1);    
end

% put dx and dy in expected format (Nx2 arrays)
[~,ncoldx] = size(dx);
[~,ncoldy] = size(dy);
if ncoldx ~= 2
    dx = dx';
end
if ncoldy ~= 2
    dy = dy';
end

% check for Nan and Inf values in errs
dx(isnan(dx)) = 0;
dy(isnan(dy)) = 0;
dx(isinf(dx)) = 0;
dy(isinf(dy)) = 0;

% put x and y into expected format (Nx1 vectors)
x = x(:);
y = y(:);

% check that sizes match
assert(all(size(x) == size(y)),'x and y do not have the same dimensions');
assert(all(size(x) == size(dx(:,1))),'x and dx do not have the same number of data');
assert(all(size(y) == size(dy(:,1))),'y and dy do not have the same number of data');


%%

nData = numel(x);
hold(hAx,'on');
hdx = gobjects(1,nData);
hdy = gobjects(1,nData);
for iData = 1:nData
    % plot x errors
    xMinus = x(iData) - dx(iData,1);
    xPlus  = x(iData) + dx(iData,2);
    hdx(iData) = plot(hAx,[xMinus,xPlus],[y(iData),y(iData)],plotAttributes{:});

    % plot y errors
    yMinus = y(iData) - dy(iData,1);
    yPlus  = y(iData) + dy(iData,2);
    hdy(iData) = plot(hAx,[x(iData),x(iData)],[yMinus,yPlus],plotAttributes{:});
    
end

% move error bars to bottom layer
uistack(hdx,'bottom');
uistack(hdy,'bottom');

% Turn off handle visibilty so error bars won't show up in legend 
% (As suggested for errbar.m): 
set(hdx(:),'handlevisibility','off');
set(hdy(:),'handlevisibility','off');



end
