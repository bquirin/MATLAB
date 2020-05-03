clc; clear;
agents=10000; % number of simulated surfers
itern=10; % number of iterations
anisteps=25; % how smooth animations are

pausedur=0.5; % a short duration after each step

figure;
axes('visible','off');
minsize=5; % minimum size of agent disc
maxsize=9; % the size to move agents behind

% data structures for a specific graph
[A N nodes1 nodes2 edges edgesx edgesy curves]=plotgraph6(anisteps);
degree=sum(A);

state=randi(N,agents,1); % original positions for all agents
newstate=state;

for k=1:N
    s=length(find(state==k));
    if sqrt(s)>=maxsize
        set(nodes1(k),'MarkerSize',minsize+sqrt(s));
        set(nodes2(k),'MarkerSize',0.1);
    elseif s>=1
        set(nodes1(k),'MarkerSize',0.1);
        set(nodes2(k),'MarkerSize',minsize+sqrt(s));
    else
        set(nodes1(k),'MarkerSize',0.1);
        set(nodes2(k),'MarkerSize',0.1);
    end
end
pause on; pause;

for i=1:itern
    % decide who goes where
    fromto=zeros(N); % the number of travellers from i to j
    for a=1:agents
        if degree(state(a))>0
            from=state(a);
            ways=find(A(:,from)>0);
            newstate(a)=ways(randi(numel(ways)));
            fromto(newstate(a),from)=fromto(newstate(a),from)+1;
        end
    end
    % update node sizes (before animation)
    for k=1:N
        remains=length(find(state==k))-sum(fromto(:,k))+fromto(k,k);
        if sqrt(remains)>=maxsize
            set(nodes1(k),'MarkerSize',minsize+sqrt(remains));
            set(nodes2(k),'MarkerSize',0.1);
        elseif remains>=1
            set(nodes1(k),'MarkerSize',0.1);
            set(nodes2(k),'MarkerSize',minsize+sqrt(remains));
        else
            set(nodes1(k),'MarkerSize',0.1);
            set(nodes2(k),'MarkerSize',0.1);
        end
    end
    % animate motion along edges
    for t=2:anisteps
        for e=1:size(edges,1)
            set(curves(e),'XData',edgesx(e,t));
            set(curves(e),'YData',edgesy(e,t));
            s=fromto(edges(e,2),edges(e,1));
            if s>=1
                set(curves(e),'MarkerSize',minsize+sqrt(s));
            else
                set(curves(e),'MarkerSize',0.1);
            end
        end
        drawnow; pause(.025);
    end
    % update node sizes (after animation)
    state=newstate;
    for e=1:size(edges,1)
        set(curves(e),'MarkerSize',0.1);
    end
    for k=1:N
        s=length(find(state==k));
        if sqrt(s)>=maxsize
            set(nodes1(k),'MarkerSize',minsize+sqrt(s));
            set(nodes2(k),'MarkerSize',0.1);
        elseif s>=1
            set(nodes1(k),'MarkerSize',0.1);
            set(nodes2(k),'MarkerSize',minsize+sqrt(s));
        else
            set(nodes1(k),'MarkerSize',0.1);
            set(nodes2(k),'MarkerSize',0.1);
        end
    end
    pause(pausedur);
end

% print out proportions of agents at each node at the end
for k=1:N
    fprintf('node %d: %.4f\n',k,length(find(state==k))/agents);
end
