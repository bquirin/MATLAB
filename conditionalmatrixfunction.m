function y = conditionalmatrix(A) % A is adjacency matrix 
%This function takes in your matrix and outputs a conditional matrix.

    N = size(A,1); % N = the size of out matrix 
    
    outdeg=sum(A); % outdegree is computed this way 
    C = zeros(N,N);
    % C is initialised as a matrix of zeros the same dimension as matrix A
    for from=1:N
        for to=1:N
            % probability to go from "from" node to "to" node
            % depends on whether there is an edge going from
            % "from" to "to" and also on the out-degree of
            % the "from" node
            C(to,from) = A(to,from)/outdeg(from);
        end
    end
      % this nested loops goes through all elements of C, i.e. it
    % looks at every possible combination of "from" and "to" nodes
    
    y = C; % return the resulting condtional matrix 
end
