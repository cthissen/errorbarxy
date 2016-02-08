# errorbarxy: plot errors in x and y

What is it?
----------------- 
Errors can be asymmetric and vary by data point.  
<img src="https://github.com/cthissen/errorbarxy/blob/master/errorbarxy.png" alt="errorbarxy" width="300px" height="300px">


For comments, questions, or suggestions, please email cthissen@gmail.com or 
leave a comment under the issues tab at github.com/cthissen/errorbarxy/issues

Christopher J. Thissen, Yale University  

Why?
-----------------
MATLAB's built-in errorbar function only plots errors in y. Sometimes x has errors too.


Usage
------------------ 
Usage is simple.
For example,
````
x = linspace(0,2,20);
y = sin(2*pi*x);
dx = 0.1*ones(size(x));
dy = 0.3*ones(size(x));
plot(x,y);
errorbarxy(x,y,dx,dy);
````
draws error bars for x and y. 

<img src="https://github.com/cthissen/errorbarxy/blob/master/errorbarxy2.png" alt="errorbarxy" width="300px" height="300px">

Here's an example where each datapoint has unique errors. The look of the errors can be adjusted using standard linespec inputs (e.g. 'LineWidth',2). Inf and NaN values are ignored.
````
hFig = figure(1);
hAx = axes;
x = linspace(0,2,15);
y = sin(2*pi*x);
dy(:,1) = 0.5*sin(x);
dy(:,2) = 0.3*ones(numel(x),1);
dx(:,1) = 0.05*ones(size(x));
dx(:,2) = 0.4*sin(x);
dx(10) = NaN;
dx(12) = Inf;
dy(4,1) = NaN;
dy(10,1) = Inf;
plot(x,y,'-k','LineWidth',1);
hold(hAx,'on');
scatter(x,y,50,'k','filled')
errorbarxy(hAx,x,y,dx,dy,'b','LineWidth',2);
````
<img src="https://github.com/cthissen/errorbarxy/blob/master/errorbarxy3.png" alt="errorbarxy" width="300px" height="300px">



Finally, the look of individual error bars can be adjusted. For example:
````
close all; clear all; clc
x = linspace(0,2,20);
y = sin(2*pi*x);
dy(:,1) = 0.1*ones(numel(x),1);
dy(:,2) = 0.3*ones(numel(x),1);
dx = 0.05*ones(size(x));
plot(x,y,'.-b','LineWidth',2);
[hdx,hdy] = errorbarxy(x,y,dx,dy,'-b','LineWidth',2);
hdx(1).LineWidth = 10;
hdy(10).Color = 'red';
````
<img src="https://github.com/cthissen/errorbarxy/blob/master/errorbarxy4.png" alt="errorbarxy" width="300px" height="300px">


Addtional details are in errorbarxy.m. For examples see test_errorbarxy.m. No toolboxes are required.

The Latest Version
------------------ 
Details of the latest version can be found on the github project page under 
  server project page under https://github.com/cthissen/errorbarxy

Contributors
------------------ 
Christopher Thissen, Yale University. cthissen@gmail.com


Feedback
------------------ 
Your comments are welcome! If you find any bugs or have feature requests report them to
Christopher Thissen, christopher.thissen@yale.edu. 

Issues can also be reported online: https://github.com/cthissen/errorbarxy/issues


License
------------------ 
See License file.
