function [A N nodes1 nodes2 edges edgesx edgesy curves]=plotgraph2(n)

    A = [ 0 1 0 1 0 0 0 0 0 0 0 0 1 ;
          1 0 1 1 0 0 0 0 0 0 0 0 0 ;
          0 1 0 1 0 0 0 0 0 0 0 0 1 ;
          1 1 1 0 0 0 0 0 0 0 0 0 0 ;
          0 0 0 1 0 0 0 0 0 0 0 0 0 ;
          0 0 0 0 1 0 0 0 0 0 0 0 0 ;
          0 0 0 0 1 0 0 0 0 0 0 0 0 ;
          0 0 0 0 1 0 0 0 0 0 0 0 0 ;
          0 0 0 0 1 0 0 0 0 0 0 0 0 ;
          0 0 0 0 1 0 0 0 0 0 0 0 0 ;
          0 0 0 0 1 0 0 0 0 0 0 0 0 ;
          0 0 0 0 1 0 0 0 0 0 0 0 0 ;
          0 0 0 0 0 1 1 1 1 1 1 1 0 ]; % adjacency matrix
      
    N = size(A,1); % number of nodes
    
    nodexy = [ 9  7 ;
               11 4 ;
               9  1 ;
               7  4 ;
               5  4 ;
               3  7 ;
               3  6 ;
               3  5 ;
               3  4 ;
               3  3 ;
               3  2 ;
               3  1 ;
               1  4 ]; % node coordinates
           
	t = 0:n; % parametrized time
    
    edges=[];
    edgesx=[];
    edgesy=[];
    
    edges(1,:)=[1 2];
    edgesx(1,:)=linspace(nodexy(1,1),nodexy(2,1),n)+0.25*sin(linspace(0,pi,n));
    edgesy(1,:)=linspace(nodexy(1,2),nodexy(2,2),n)+0.25*sin(linspace(0,pi,n));

    edges(2,:)=[1 4];
    edgesx(2,:)=linspace(nodexy(1,1),nodexy(4,1),n)+0.25*sin(linspace(0,pi,n));
    edgesy(2,:)=linspace(nodexy(1,2),nodexy(4,2),n)-0.25*sin(linspace(0,pi,n));

    edges(3,:)=[2 1];
    edgesx(3,:)=linspace(nodexy(2,1),nodexy(1,1),n)-0.25*sin(linspace(0,pi,n));
    edgesy(3,:)=linspace(nodexy(2,2),nodexy(1,2),n)-0.25*sin(linspace(0,pi,n));

    edges(4,:)=[2 3];
    edgesx(4,:)=linspace(nodexy(2,1),nodexy(3,1),n)+0.25*sin(linspace(0,pi,n));
    edgesy(4,:)=linspace(nodexy(2,2),nodexy(3,2),n)-0.25*sin(linspace(0,pi,n));

    edges(5,:)=[2 4];
    edgesx(5,:)=linspace(nodexy(2,1),nodexy(4,1),n);
    edgesy(5,:)=linspace(nodexy(2,2),nodexy(4,2),n)-0.25*sin(linspace(0,pi,n));

    edges(6,:)=[3 2];
    edgesx(6,:)=linspace(nodexy(3,1),nodexy(2,1),n)-0.25*sin(linspace(0,pi,n));
    edgesy(6,:)=linspace(nodexy(3,2),nodexy(2,2),n)+0.25*sin(linspace(0,pi,n));

    edges(7,:)=[3 4];
    edgesx(7,:)=linspace(nodexy(3,1),nodexy(4,1),n)-0.25*sin(linspace(0,pi,n));
    edgesy(7,:)=linspace(nodexy(3,2),nodexy(4,2),n)-0.25*sin(linspace(0,pi,n));

    edges(8,:)=[4 1];
    edgesx(8,:)=linspace(nodexy(4,1),nodexy(1,1),n)-0.25*sin(linspace(0,pi,n));
    edgesy(8,:)=linspace(nodexy(4,2),nodexy(1,2),n)+0.25*sin(linspace(0,pi,n));

    edges(9,:)=[4 2];
    edgesx(9,:)=linspace(nodexy(4,1),nodexy(2,1),n);
    edgesy(9,:)=linspace(nodexy(4,2),nodexy(2,2),n)+0.25*sin(linspace(0,pi,n));

    edges(10,:)=[4 3];
    edgesx(10,:)=linspace(nodexy(4,1),nodexy(3,1),n)+0.25*sin(linspace(0,pi,n));
    edgesy(10,:)=linspace(nodexy(4,2),nodexy(3,2),n)+0.25*sin(linspace(0,pi,n));

    edges(11,:)=[4 5];
    edgesx(11,:)=linspace(nodexy(4,1),nodexy(5,1),n);
    edgesy(11,:)=linspace(nodexy(4,2),nodexy(5,2),n);

    edges(12,:)=[5 6];
    edgesx(12,:)=linspace(nodexy(5,1),nodexy(6,1),n);
    edgesy(12,:)=linspace(nodexy(5,2),nodexy(6,2),n);

    edges(13,:)=[5 7];
    edgesx(13,:)=linspace(nodexy(5,1),nodexy(7,1),n);
    edgesy(13,:)=linspace(nodexy(5,2),nodexy(7,2),n);

    edges(14,:)=[5 8];
    edgesx(14,:)=linspace(nodexy(5,1),nodexy(8,1),n);
    edgesy(14,:)=linspace(nodexy(5,2),nodexy(8,2),n);

    edges(15,:)=[5 9];
    edgesx(15,:)=linspace(nodexy(5,1),nodexy(9,1),n);
    edgesy(15,:)=linspace(nodexy(5,2),nodexy(9,2),n);

    edges(16,:)=[5 10];
    edgesx(16,:)=linspace(nodexy(5,1),nodexy(10,1),n);
    edgesy(16,:)=linspace(nodexy(5,2),nodexy(10,2),n);

    edges(17,:)=[5 11];
    edgesx(17,:)=linspace(nodexy(5,1),nodexy(11,1),n);
    edgesy(17,:)=linspace(nodexy(5,2),nodexy(11,2),n);

    edges(18,:)=[5 12];
    edgesx(18,:)=linspace(nodexy(5,1),nodexy(12,1),n);
    edgesy(18,:)=linspace(nodexy(5,2),nodexy(12,2),n);

    edges(19,:)=[6 13];
    edgesx(19,:)=linspace(nodexy(6,1),nodexy(13,1),n);
    edgesy(19,:)=linspace(nodexy(6,2),nodexy(13,2),n);

    edges(20,:)=[7 13];
    edgesx(20,:)=linspace(nodexy(7,1),nodexy(13,1),n);
    edgesy(20,:)=linspace(nodexy(7,2),nodexy(13,2),n);

    edges(21,:)=[8 13];
    edgesx(21,:)=linspace(nodexy(8,1),nodexy(13,1),n);
    edgesy(21,:)=linspace(nodexy(8,2),nodexy(13,2),n);

    edges(22,:)=[9 13];
    edgesx(22,:)=linspace(nodexy(9,1),nodexy(13,1),n);
    edgesy(22,:)=linspace(nodexy(9,2),nodexy(13,2),n);

    edges(23,:)=[10 13];
    edgesx(23,:)=linspace(nodexy(10,1),nodexy(13,1),n);
    edgesy(23,:)=linspace(nodexy(10,2),nodexy(13,2),n);

    edges(24,:)=[11 13];
    edgesx(24,:)=linspace(nodexy(11,1),nodexy(13,1),n);
    edgesy(24,:)=linspace(nodexy(11,2),nodexy(13,2),n);

    edges(25,:)=[12 13];
    edgesx(25,:)=linspace(nodexy(12,1),nodexy(13,1),n);
    edgesy(25,:)=linspace(nodexy(12,2),nodexy(13,2),n);

    edges(26,:)=[13 1];
    edgesx(26,:)=linspace(nodexy(13,1),nodexy(1,1),n)-2*sin(linspace(0,pi,n));
    edgesy(26,:)=linspace(nodexy(13,2),nodexy(1,2),n)+2*sin(linspace(0,pi,n));

    edges(27,:)=[13 3];
    edgesx(27,:)=linspace(nodexy(13,1),nodexy(3,1),n)-2*sin(linspace(0,pi,n));
    edgesy(27,:)=linspace(nodexy(13,2),nodexy(3,2),n)-2*sin(linspace(0,pi,n));

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
        arrow(edgesx(i,:),edgesy(i,:),0.2,0.3,0.75);
    end

    nodes2=zeros(size(nodexy,1),1);
    for i=1:size(nodexy,1)
        plot(nodexy(i,1),nodexy(i,2),'ok','MarkerFaceColor','black','MarkerSize',12);
        text(nodexy(i,1),nodexy(i,2),num2str(i),'HorizontalAlignment','center',...
            'FontName','Arial','FontSize',10,'FontWeight','normal','Color','white');
        nodes2(i)=plot(nodexy(i,1),nodexy(i,2),'or','MarkerFaceColor','red');
    end
    
    xlim([0.5 11.5]); ylim([0 8]);
    hold off;
end
