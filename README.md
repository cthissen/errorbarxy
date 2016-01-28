# errorbarxy: Plot error bars in both x and y using MATLAB.

What is it?
----------------- 
errorbarxy plot error bars in x and y.
For example,
     x = linspace(0,2,20);
     y = sin(2*pi*x);
     dx = 0.1*ones(size(x));
     dy = 0.3*ones(size(x));
     plot(x,y,'.-k');
     errorbarxy(x,y,dx,dy);
   draws symmetric error bars around x and y
<img src="https://github.com/cthissen/errorbarxy/blob/master/errorbarxy.png" alt="errorbarxy" width="400px" height="400px">

For comments, questions, or suggestions, please email cthissen@gmail.com or 
leave a comment under the issues tab at github.com/cthissen/estream2

Christopher J. Thissen, Yale University  

Why?
-----------------
MATLAB's built-in errorbar function only allows for errors in x. 

Requirements & Installation
------------------ 
No toolboxes are required to run the program, and no installation is necessary.

Usage
------------------ 
additional usage examples are given in test_errorbarxy.m, or by reading the documentation in errorbarxy.m


The Latest Version
------------------ 
Details of the latest version can be found on the github project page under 
  server project page under https://github.com/cthissen/Drex-MATLAB

Contributors
------------------ 
Christopher Thissen, Yale University. cthissen@gmail.com


Feedback
------------------ 
Your comments are welcome! If you find any bugs or have feature requests report them to
Christopher Thissen, christopher.thissen@yale.edu. 

Issues can also be reported online: https://github.com/cthissen/estream2/issues


License
------------------ 
See License file.
