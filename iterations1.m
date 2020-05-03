clc; 
clear; 
close all; 
%-------------------------------------------------------------------------%
A = [0 1 0 1; 
     0 0 0 0; 
     1 1 0 0; 
     1 1 1 0 ]; 
 C = cmat1(A); 
 iterations = 30; 
 p = [0;
      1; 
      0;
      0]; 
  figure; 
  hold on; 
  
  for count = 1:iterations 
      plot(count,p(1),'^r',count,p(2),'ok',count,p(3),'+b',count,p(4),...
          '*k','MarkerSize',6);
      
      p = C*p; 
  end 
  legend('node11','node12','node13','node14'); 
  xlabel('iterations'); 
  hold off; 