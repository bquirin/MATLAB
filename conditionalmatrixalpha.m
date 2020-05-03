%-------------------------------------------------------------------------%
%Session 2: Task 3
%-------------------------------------------------------------------------%

function y = conditionalmatrixalpha(A,alpha) 
% A is our matrix and alpha is specified. 
% This function takes two parameters

nodes = size(A,1); %amount of nodes in network.

outdegree=sum(A); % outdegrees of matrix
ProbA = zeros(nodes,nodes);
%matrix of zeros with the same dimension as A.
%ProbA = probability/conditional matrix

% this nested loops goes through all elements of ProbA, i.e. it
% looks at every possible combination of "columns" and "row" nodes
for columns=1:nodes
    for rows=1:nodes
        % probability to go from "column" node to "row" node
        % depends on whether there is an edge going from
        % "column" to "row" and also on the out-degree of
        % the "column" node
        if columns == rows
            %dont stay at dead end node
            ProbA(rows,columns)= 0;
        else if outdegree(columns) > 0
                ProbA(rows,columns) = alpha/(nodes-1)...
                    +(1-alpha)*A(rows,columns)/outdegree(columns);
                %jump to a random node or follow ones the links
            else
                ProbA(rows,columns) = 1/(nodes-1)
                %jump to a random node
            end
        end
    end
    
    y = ProbA; % return the resulting matrix
end
