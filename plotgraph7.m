function [A N nodes1 nodes2 edges edgesx edgesy curves]=plotgraph7(n)

    A = [ 0 1 0 1 ; 
          0 0 0 0 ; 
          1 1 0 0 ;  
          1 1 1 0 ]; % adjacency matrix
      
    N = size(A,1); % number of nodes
    
    nodexy = [ 1 4 ;
               4 4 ;
               4 1 ;
               1 1 ]; % node coordinates
           
	t = 0:n; % parametrized time
    
    edges=[];
    edgesx=[];
    edgesy=[];

    edges(1,:)=[1 3];
    edgesx(1,:)=linspace(nodexy(1,1),nodexy(3,1),n);
    edgesy(1,:)=linspace(nodexy(1,2),nodexy(3,2),n);
    
    edges(2,:)=[1 4];
    edgesx(2,:)=linspace(nodexy(1,1),nodexy(4,1),n)+0.25*sin(linspace(0,pi,n));
    edgesy(2,:)=linspace(nodexy(1,2),nodexy(4,2),n);

    edges(3,:)=[2 1];
    edgesx(3,:)=linspace(nodexy(2,1),nodexy(1,1),n);
    edgesy(3,:)=linspace(nodexy(2,2),nodexy(1,2),n);

    edges(4,:)=[2 3];
    edgesx(4,:)=linspace(nodexy(2,1),nodexy(3,1),n);
    edgesy(4,:)=linspace(nodexy(2,2),nodexy(3,2),n);

    edges(5,:)=[2 4];
    edgesx(5,:)=linspace(nodexy(2,1),nodexy(4,1),n);
    edgesy(5,:)=linspace(nodexy(2,2),nodexy(4,2),n);
    
    edges(6,:)=[4 1];
    edgesx(6,:)=linspace(nodexy(4,1),nodexy(1,1),n)-0.25*sin(linspace(0,pi,n));
    edgesy(6,:)=linspace(nodexy(4,2),nodexy(1,2),n);

    edges(7,:)=[3 4];
    edgesx(7,:)=linspace(nodexy(3,1),nodexy(4,1),n);
    edgesy(7,:)=linspace(nodexy(3,2),nodexy(4,2),n);
    
    %    edges(1,:)=[1 2];
%    edgesx(1,:)=linspace(nodexy(1,1),nodexy(2,1),n)+0.25*sin(linspace(0,pi,n));
%    edgesy(1,:)=linspace(nodexy(1,2),nodexy(2,2),n)+0.25*sin(linspace(0,pi,n));



	hold on;
    nodes1=zeros(size(nodexy,1),1);
    for i=1:size(nodexy,1)
        nodes1(i)=plot(nodexy(i,1),nodexy(i,2),'or','MarkerFaceColor','red');
    end

    curves=zeros(size(edges,1),1);
    for i=1:size(edges,1)
        curves(i)=plot(edgesx(i,1),edgesy(i,1),'or','MarkerFaceColor','red','MarkerSize',1);
    end
    
    for i=1:size(edges,1)
        plot(edgesx(i,:),edgesy(i,:),'-k');
        arrow(edgesx(i,:),edgesy(i,:),0.2,0.2,0.75);
    end

    nodes2=zeros(size(nodexy,1),1);
    for i=1:size(nodexy,1)
        plot(nodexy(i,1),nodexy(i,2),'ok','MarkerFaceColor','black','MarkerSize',12);
        text(nodexy(i,1),nodexy(i,2),num2str(i),'HorizontalAlignment','center',...
            'FontName','Arial','FontSize',10,'FontWeight','normal','Color','white');
        nodes2(i)=plot(nodexy(i,1),nodexy(i,2),'or','MarkerFaceColor','red');
    end
    
    xlim([0.5 4.5]); ylim([0.5 4.5]);
    hold off;
end
