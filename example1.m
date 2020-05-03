clc; clear;

A = [0 0 0 0 1 0 0 0 0 0; 
     0 0 0 1 1 1 1 1 1 0; 
     0 0 0 0 0 1 0 1 0 0; 
     0 0 0 0 0 0 0 0 0 0; 
     0 1 0 0 0 0 0 1 0 0; 
     0 1 0 1 0 0 1 0 0 1; 
     0 1 0 1 0 1 0 1 1 0; 
     0 0 0 0 0 0 0 0 0 0; 
     1 1 0 1 0 0 1 0 0 1; 
     0 0 0 0 0 0 0 0 1 0]; % our network

hold on; % ensure that new points are added to existing graph
  
for alpha=0.01:0.025:0.99
  
    CondtionMatrix = conditionalmatrixalpha(A,alpha); 
    % The condition matrix is computed by the function
    % conditionalmatrixalpha

    Nodes = size(A,2); % the number of nodes in the network

    System = [ CondtionMatrix - eye(Nodes,Nodes); % the system matrix...
           ones(1,Nodes) ]; % with a row of 1s added at the bottom
    x = [ zeros(Nodes,1);
              1 ]; % the right-hand side vector
  
    ProbabilityVector = System \ x % solve the resulting linear system
    
    plot(alpha,ProbabilityVector(1),'ok',alpha,ProbabilityVector(2),'^b'... 
        ,alpha,ProbabilityVector(3),'sr',alpha,ProbabilityVector(4),'vg');
end

hold off; % switch off the mode where points were added to graph

legend(['P1'; 'P2'; 'P3'; 'P4']);