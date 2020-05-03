clc; 
clear; 
close all; 
%-------------------------------------------------------------------------%
%Session 1 Task 3 
%-------------------------------------------------------------------------%
A = [0 0 0 1 1 ;
     1 0 0 0 0 ;
     0 1 0 0 1 ;
     0 0 1 0 0 ;
     1 1 1 1 0 ];  
 % This is matrix A
 indegree5= sum(A(5,:)); 
 % This sums all of row 5 which is our indegree 
 outdegrees = sum(A)
 %This sums each column which gives us an outdegree for each columns 
 fprintf('The indegree for node 5 is %0.1f \n',indegree5) 