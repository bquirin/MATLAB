clc;
clear;
close all;
%-------------------------------------------------------------------------%
%Challenge Question
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
     0 0 0 0 0 0 0 0 1 0 0;
     1 0 0 1 0 1 1 0 0 1 0]; % our network

figure('units','normalized','outerposition',[0 0 1 1]) 
%makes the window full screen
hold on; % ensure that all points are added to existing graph
  
for alpha=0.01:0.025:0.99
  
    ConditionMatrix = conditionalmatrixalpha(A,alpha); 
    % The condition matrix is computed by the function
    % conditionalmatrixalpha

    Nodes = size(A,2); % the number of nodes in the network

    System = [ ConditionMatrix - eye(Nodes,Nodes); % the system matrix
           ones(1,Nodes) ]; %a row of 1s added at the bottom
    x = [ zeros(Nodes,1);
              1 ]; 
  
    ProbVector = System \ x % calculates probability vector
    
    plot(alpha,ProbVector(1),'ok',alpha,ProbVector(2),'^b'... 
        ,alpha,ProbVector(3),'sr',alpha,ProbVector(4),'vr'...
        ,alpha,ProbVector(5),'>m',alpha,ProbVector(6),'*g'... 
        ,alpha,ProbVector(7),'<y',alpha,ProbVector(8),'dg'... 
        ,alpha,ProbVector(9),'vc',alpha,ProbVector(10),'hk'); 
    %The letters in quotes are specifiers e.g 'dg'= diamond green
end

hold off; % switch off the mode where points were added to graph 

xlabel('Alpha'); % x axis title
ylabel('Probability'); % y axis total 
title('Change in alpha');
legend('Matrices','Functions','Limits','Differential Equations'...
    ,'Linear Algebra','Integration','Differatiation','Infinite series'...
    ,'Trigonometry','Geometry','Location','northeastoutside'); % legends   




