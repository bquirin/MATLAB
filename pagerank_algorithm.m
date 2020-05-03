clc;
clear;
close all;
%-------------------------------------------------------------------------%
%Final Pagerank algorithm
%-------------------------------------------------------------------------%
A = [0 0 0 0 1 0 0 0 0 0 0; 
     0 0 0 1 1 1 1 1 1 0 0; 
     0 0 0 0 0 1 0 1 0 0 0; 
     0 0 0 0 0 0 0 0 0 0 0; 
     0 1 0 0 0 0 0 1 0 0 0; 
     0 1 0 1 0 0 1 0 0 1 0; 
     0 1 0 1 0 1 0 0 1 0 0; 
     0 0 0 0 0 0 0 0 0 0 0; 
     1 1 0 1 0 0 1 0 0 1 0; 
     0 0 0 0 0 0 0 0 1 0 0
     1 0 0 1 0 1 1 0 0 1 0;]; % network
ConditionMatrix = conditionalmatrixalpha(A,0.15);
%function changes A into probability matrix
Nodes = size(A,2); %N = size of matrix
System = [ConditionMatrix - eye(Nodes,Nodes); %system matrix
    ones(1,Nodes)];
% an additional row of 1s at the bottom of the matrix
x= [zeros(Nodes,1); % vector of zeros 
    1]; % plus one at the bottom of it 
ProbabilityVector = System \ x; 
%This is matlabs backslash operator that solves systems of liner equations
%(system)(vector)= probability matrix   

topics={...
'Matrices', ProbabilityVector(1),...
'Functions',     ProbabilityVector(2),...
'Limits',     ProbabilityVector(3),...
'Differential Equations',     ProbabilityVector(4),...
'Linear Equations',  ProbabilityVector(5),...
'Integration',      ProbabilityVector(6),...
'Differentiation',     ProbabilityVector(7),...
'Infinite series',    ProbabilityVector(8),...
'Trigonometry',   ProbabilityVector(9),...
'Geometry',     ProbabilityVector(10),... 
'Vectors',     ProbabilityVector(11)};


probs=cell2mat( topics(2:2:end) ); 
%appends the data together 
N=length(probs);
%sorts the data in size order 
[numbers, position]=sort(probs, 'descend');

for count=1:N
  j=position(count);
  fprintf('%.4f %s\n', probs(j), topics{2*j-1});
end 
%prints out the prob vector with topics in order.


