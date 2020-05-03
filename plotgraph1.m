function [A N nodes1 nodes2 edges edgesx edgesy curves]=plotgraph1(n)

    A = [ 0 0 0 0 0 1 0 0 ;
          0 0 1 0 0 0 0 0 ;
          0 0 0 0 0 1 0 0 ;
          1 0 0 0 0 0 0 0 ;
          1 1 1 1 0 0 0 0 ;
          0 0 0 0 1 0 1 1 ;
          1 1 0 0 0 0 0 1 ;
          0 0 1 1 0 0 1 0 ]; % adjacency matrix
      
    N = size(A,1); % number of nodes
    
    nodexy = [ 1 4 ;
               2 4 ;
               4 4 ;
               5 4 ;
               3 3 ;
               3 2 ;
               2 1 ;
               4 1 ]; % node coordinates
           
	t = 0:n; % parametrized time
    edges(1,:)=[1 4];
    edgesx(1,:)=linspace(nodexy(1,1),nodexy(4,1),n);
    edgesy(1,:)=nodexy(1,2)+0.75*sin(linspace(0,pi,n));
    
    edges(2,:)=[1 5];
    edgesx(2,:)=linspace(nodexy(1,1),nodexy(5,1),n);
    edgesy(2,:)=linspace(nodexy(1,2),nodexy(5,2),n);
    
    edges(3,:)=[1 7];
    edgesx(3,:)=linspace(nodexy(1,1),nodexy(7,1),n);
    edgesy(3,:)=linspace(nodexy(1,2),nodexy(7,2),n);
    
    edges(4,:)=[2 5];
    edgesx(4,:)=linspace(nodexy(2,1),nodexy(5,1),n);
    edgesy(4,:)=linspace(nodexy(2,2),nodexy(5,2),n);
    
    edges(5,:)=[2 7];
    edgesx(5,:)=linspace(nodexy(2,1),nodexy(7,1),n);
    edgesy(5,:)=linspace(nodexy(2,2),nodexy(7,2),n);
    
    edges(6,:)=[3 2];
    edgesx(6,:)=linspace(nodexy(3,1),nodexy(2,1),n);
    edgesy(6,:)=linspace(nodexy(3,2),nodexy(2,2),n);
    
    edges(7,:)=[3 5];
    edgesx(7,:)=linspace(nodexy(3,1),nodexy(5,1),n);
    edgesy(7,:)=linspace(nodexy(3,2),nodexy(5,2),n);
    
    edges(8,:)=[3 8];
    edgesx(8,:)=linspace(nodexy(3,1),nodexy(8,1),n);
    edgesy(8,:)=linspace(nodexy(3,2),nodexy(8,2),n);
    
    edges(9,:)=[4 5];
    edgesx(9,:)=linspace(nodexy(4,1),nodexy(5,1),n);
    edgesy(9,:)=linspace(nodexy(4,2),nodexy(5,2),n);
    
    edges(10,:)=[4 8];
    edgesx(10,:)=linspace(nodexy(4,1),nodexy(8,1),n);
    edgesy(10,:)=linspace(nodexy(4,2),nodexy(8,2),n);
    
    edges(11,:)=[5 6];
    edgesx(11,:)=linspace(nodexy(5,1),nodexy(6,1),n);
    edgesy(11,:)=linspace(nodexy(5,2),nodexy(6,2),n);

    edges(12,:)=[6 1];
    edgesx(12,:)=linspace(nodexy(6,1),nodexy(1,1),n);
    edgesy(12,:)=linspace(nodexy(6,2),nodexy(1,2),n);

    edges(13,:)=[6 3];
    edgesx(13,:)=linspace(nodexy(6,1),nodexy(3,1),n);
    edgesy(13,:)=linspace(nodexy(6,2),nodexy(3,2),n);

    edges(14,:)=[7 6];
    edgesx(14,:)=linspace(nodexy(7,1),nodexy(6,1),n);
    edgesy(14,:)=linspace(nodexy(7,2),nodexy(6,2),n);

    edges(15,:)=[7 8];
    edgesx(15,:)=linspace(nodexy(7,1),nodexy(8,1),n);
    edgesy(15,:)=nodexy(7,2)+0.125*sin(linspace(0,pi,n));

    edges(16,:)=[8 6];
    edgesx(16,:)=linspace(nodexy(8,1),nodexy(6,1),n);
    edgesy(16,:)=linspace(nodexy(8,2),nodexy(6,2),n);

    edges(17,:)=[8 7];
    edgesx(17,:)=linspace(nodexy(8,1),nodexy(7,1),n);
    edgesy(17,:)=nodexy(8,2)-0.125*sin(linspace(0,pi,n));

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
            'FontName','Arial','FontSize',12,'Color','white');
        nodes2(i)=plot(nodexy(i,1),nodexy(i,2),'or','MarkerFaceColor','red');
    end
    
    xlim([0.5 5.5]); ylim([0.5 5]);
    hold off;
end
