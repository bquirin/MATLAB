%-------------------------------------------------------------------------%
%For loops 
%-------------------------------------------------------------------------%
%for loop counter = vector 
    %code 
%end 

%for counter = 1:10 
 %   counter 
%end

%a = 1:10;
%sum_a= 0; 

%for counter = 1:length(a)
 %   sum_a = sum_a +a(counter)
%end 
%disp(sum_a) ;

%for counter = 1:2:length(a)
%    sum_a = sum_a +a(counter)
%end 
%disp(sum_a)  

%b = 1:10; 
%vector = [1 4 9 3];
%sum_b = 0; 
%for count = vector 
 %   sum_b = sum_b + b(count) 
%end 
%disp(sum_b)
 
a = 20:25
sum_vec = zeros(1,length(a)) 
sum_a = 0
for count = 1:length(a)
    sum_a = sum_a+ a(count)
    sum_vec(count) = sum_a 
end 

figure; plot(sum_vec)

