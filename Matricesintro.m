%------------------------------------------------------------------------%
%Introduction to matrices and vectors 
%Three important lines 
%------------------------------------------------------------------------%
clear variables; %clears variables 
close all; % clears command history
clc; %clears command window
%------------------------------------------------------------------------%
%Making vectors and matrices% 
a = [1,2,3,4]; %makes a row vector. 
b = [ 1
      2
      3
      4 ]; % or [1;2;3;4] 
%matlab is case sensitive
A = [1 2 3 4; 5 6 7 8; 8 7 6 5; 2 3 4 5 ]; 
B = [   1   2   3   4
        5   7   8   9   
        6   9   0   1   
        1   2   3   5]; 

E = B';%transposes B matrix
%------------------------------------------------------------------------%
%Vector Math
%------------------------------------------------------------------------% 
%Matrix Multiplication %make sure matrix dimension are correct
c = a*b; % gives us a 1x1 matrix 
C = A*B; %gives us a 4x4 matrix 
%Element by Element multiplcation 
%Vectors must be the same dimension in order to do this. 
d = a.*b'; %performs element by element multiplication
% b' is b transposed because of dimension of matrix 
D = A.*B;  
a2= a.^2; %squares each element in a. 

%Scalar multiplication and addtion 

a3 = 5*a; %multiplys each element in the array by 5 
a4 = a+5; % adds 5 to every element in the array
%------------------------------------------------------------------------%
%Vector and matrices shortcuts 
%------------------------------------------------------------------------%

x = [0:1:10];%makes a vector [start,steps,finish] 
y = zeros(5); %makes a nxn matrix of zeros.
z = zeros(5,2);%makes a nxm matrix of zeros. [rows,columns]
I = eye(5);% makes a 5x5 identity matrix 
o = ones(7,3);% makes a 7x3 matrix of ones. 
r = rand(5,4); % makes a 5x4 matrix of random numbers between [0,1]
%------------------------------------------------------------------------%
%Indexing and sizing 
%------------------------------------------------------------------------%
A_size = size(A);% gives us the size of our matrix 
A_rows = size(A,1); % tells us how many rows the matrix A has. 
A_columns = size(A,2); % tells us how many columns the matrix A has.
x_1 = length(x); % tells us how many elements are in the vector x.
% x(1) gives us the first element in x 
x_end  = x(end); %gives us the last element in x 
A23 = A(2,3); %returns the entry in that position 
A_col2 = A(:,2); %: = everything so this returns column 2 in matrix A
A_rows4 = A(4,:); %returns all the elements in row 4 of A
 
%------------------------------------------------------------------------%
%Outdegree 
%------------------------------------------------------------------------%
N = 4; 
i = 3;

outdegree = zeros(N,1);%column vectos outdegrees
for i = 1:N 
    outdegree(i) = sum(A(:,i)); %sums all the elements in column i
end  
%This loop calculates the outdegree of matrix A.

outdegB = sum(B); %This gives us the outdegree of B.
indegB = sum(B'); %This gives us the indegree of B by transposing it.

%fprintf prints to the command window 
%\n = new line 
% %s = string variables 
% %0.1f = decimal number to 1dp

