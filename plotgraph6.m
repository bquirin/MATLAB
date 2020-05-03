function [A N nodes1 nodes2 edges edgesx edgesy curves]=plotgraph6(n)

    A = [ 0 0 0 0 0 0 0 0 0 ;
          0 0 0 0 0 0 0 0 0 ;
          0 0 0 0 0 0 0 0 0 ;
          0 0 0 0 0 0 0 0 0 ;
          0 0 0 0 0 0 0 0 0 ;
          1 1 1 0 0 0 0 0 1 ;
          0 0 0 0 0 1 0 0 0 ;
          0 0 0 1 1 0 1 0 0 ;
          0 0 0 0 0 0 0 1 0 ]; % adjacency matrix
      
    N = size(A,1); % number of nodes
    
    nodexy = [ 1.5 3.75 ;
               1   3    ;
               1.5 2.25 ;
               6.7 0.5  ;
               6.7 1.5  ;
               3   3    ;
               5   3    ;
               5   1    ;
               3   1    ]; % node coordinates
           
	t = 0:n; % parametrized time
    
    edges=[];
    edgesx=[];
    edgesy=[];

    edges(1,:)=[1 6];
    edgesx(1,:)=linspace(nodexy(1,1),nodexy(6,1),n);
    edgesy(1,:)=linspace(nodexy(1,2),nodexy(6,2),n);
    
    edges(2,:)=[2 6];
    edgesx(2,:)=linspace(nodexy(2,1),nodexy(6,1),n);
    edgesy(2,:)=linspace(nodexy(2,2),nodexy(6,2),n);
    
    edges(3,:)=[3 6];
    edgesx(3,:)=linspace(nodexy(3,1),nodexy(6,1),n);
    edgesy(3,:)=linspace(nodexy(3,2),nodexy(6,2),n);
    
    edges(4,:)=[4 8];
    edgesx(4,:)=linspace(nodexy(4,1),nodexy(8,1),n);
    edgesy(4,:)=linspace(nodexy(4,2),nodexy(8,2),n);

    edges(5,:)=[5 8];
    edgesx(5,:)=linspace(nodexy(5,1),nodexy(8,1),n);
    edgesy(5,:)=linspace(nodexy(5,2),nodexy(8,2),n);
    
    edges(6,:)=[6 7];
    edgesx(6,:)=linspace(nodexy(6,1),nodexy(7,1),n);
    edgesy(6,:)=linspace(nodexy(6,2),nodexy(7,2),n);

    edges(7,:)=[7 8];
    edgesx(7,:)=linspace(nodexy(7,1),nodexy(8,1),n);
    edgesy(7,:)=linspace(nodexy(7,2),nodexy(8,2),n);

    edges(8,:)=[8 9];
    edgesx(8,:)=linspace(nodexy(8,1),nodexy(9,1),n);
    edgesy(8,:)=linspace(nodexy(8,2),nodexy(9,2),n);

    edges(9,:)=[9 6];
    edgesx(9,:)=linspace(nodexy(9,1),nodexy(6,1),n);
    edgesy(9,:)=linspace(nodexy(9,2),nodexy(6,2),n);

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
        arrow(edgesx(i,:),edgesy(i,:),0.2,0.25,0.75);
    end

    nodes2=zeros(size(nodexy,1),1);
    for i=1:size(nodexy,1)
        plot(nodexy(i,1),nodexy(i,2),'ok','MarkerFaceColor','black','MarkerSize',12);
        text(nodexy(i,1),nodexy(i,2),num2str(i),'HorizontalAlignment','center',...
            'FontName','Arial','FontSize',10,'FontWeight','normal','Color','white');
        nodes2(i)=plot(nodexy(i,1),nodexy(i,2),'or','MarkerFaceColor','red');
    end
    
    xlim([0.5 7.5]); ylim([0 4]);
    hold off;
end
