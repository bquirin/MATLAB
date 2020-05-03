function y = cmat1(A) % A is the original adjacency matrix

    N = size(A,1); % A is square; 1 means "the number of rows"
    
    outdeg=zeros(N,1); % columns vector of out-degrees
    for i=1:N
        outdeg(i) = sum(A(:,i)); % sum of elements in column i
    end
    
    C = zeros(N,N); % C has the same dimensions as A

    % this nested loops goes through all elements of C, i.e. it
    % looks at every possible combination of "from" and "to" nodes
    for from=1:N
        for to=1:N
            % probability to go from "from" node to "to" node
            % depends on whether there is an edge going from
            % "from" to "to" and also on the out-degree of
            % the "from" node
            C(to,from) = A(to,from)/outdeg(from);
        end
    end
    
    y = C; % return the resulting matrix
end
