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
