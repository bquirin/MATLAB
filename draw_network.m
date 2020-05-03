function draw_network(A, f)
  
  %% function draw_network(A)
  %   Draw a possible network in the current figure corresponding
  %   to an adjacency matrix A
  
  [m, n]=size(A);
  if m~=n || m==0 || n==0
    fprintf('The size of A is %d-ny-%d\n', m, n);
    fprintf('This function needs a non-empty square matrix.\n');
    return;
  end
  
  % check that the matrix only has 0s and 1s
  num0=find(A==0);
  num1=find(A==1);
  if length(num0)+length(num1)<n*n
    fprintf('not all the entries of A is 0 or 1!!\n')
    A
    fprintf('cannot continue\n');
    return;
  end
  
  % take the points as roots of unity
  k=0:(n-1);
  t=2*pi*k/n;
  x=cos(t);
  y=sin(t);
  e=0.1;
  

  % plot if figure f or figure 1 
  if nargin==1
    f=1;
  end
  figure(f);
 
  hold on
  for i=1:n
    for j=1:n
      if i==j, continue; end
      if A(i, j)==0, continue; end
  
      plot([x(i), x(j)], [y(i), y(j)], 'k', 'LineWidth', 3);
      drawarrow([x(j), y(j)], 0.2*[x(j), y(j)]+0.8*[x(i), y(i)]);
    end
  end
  
  % add the node numbers so that they can be seen
  for i=1:n
    xf=[x(i)-e, x(i)+e x(i)+e x(i)-e x(i)-e];
    yf=[y(i)-e, y(i)-e y(i)+e y(i)+e y(i)-e];
    fill(xf, yf, 'white');
    text(x(i), y(i), num2str(i), 'FontSize', 16);
  end
  hold off
  axis off
end

function drawarrow(z1, z2)
  z21=z2-z1;
  d=z21/norm(z21, 2);
  w=[-d(2), d(1)];
  z2a=z2-0.1*d;
  z2b=z2a-0.04*w;
  z2c=z2a+0.04*w;
  
  plot([z2b(1), z2(1), z2c(1)], [z2b(2), z2(2), z2c(2)], 'k', ...
        'LineWidth', 4);
end

