clc; clear; % clear the command window and memory
current_account = 2000; % starting balance of the current account
int_current = 0.005/12; % the interest rate on the current account
salary = 14550; % graduate's salary
RPI = 0.019; % RPI value
rpicar = 0.019;% rpi for car loan
stloan = 27000; % starting sum of the student loan
carloan = 12900; % starting sum of the car loan
month_expense = 1000;
carrep = 129;

if salary<21000
    repayments = 0; % monthly student loan repayment
    stu_loan_int = RPI/12; % monthly student loan interest

elseif salary<41000
    repayments = 0.09*(salary-21000)/12; % monthly student loan repayment
    stu_loan_int = (RPI+0.03*(salary-21000)/20000)/12; 
% student loan interest

else
    repayments = 0.09*(salary-21000)/12; % monthly student loan repayment
    stu_loan_int = (RPI+0.03)/12; % monthly student loan interest
end
    N = 120; % the number of months to consider
    t = 1:N+1; % our timeline
    xhist=zeros(1,N+1); % create a vector to hold the account history
    xhist(1) = current_account;
    sthist=zeros(1,N+1); % vector to hold the student loan history
    sthist(1) = stloan;
    carhist=zeros(1,N+1); % vector to hold the student loan history
    carhist(1) = carloan;

for m=1:N % commands inside the loop are executed for each month
current_account = (1+int_current)*current_account+salary/12; % apply the interest and pay in the salary
stloan = (1+stu_loan_int)*stloan; % apply the interest to the student loan
carloan = (1+rpicar)*carloan;
if stloan-repayments>0
current_account = current_account-repayments; % take money off the current account…
stloan = stloan-repayments; % ...and make student loan payment
else
current_account = current_account-stloan; % take the remainder off the current account…
stloan = 0; % ...and close the student loan
end
if carloan-carrep>0
current_account = current_account-repayments; % take money off the current account...
carloan = carloan-carrep; % ...and make student loan payment
else
current_account = current_account-carloan; % take the remainder off the current account...
carloan = 0; % ...and close the student loan
end
current_account = current_account - month_expense;
xhist(m+1) = current_account; % save the sum at the beginning of month m
sthist(m+1) = stloan; % do the same for the student loan
carhist(m+1) = carloan;% the car loan
end
fprintf('The balance of the current account is %.2f\n',current_account); % balance at the beginning of (N+1)th month
fprintf('The balance of the student loan is %.2f\n',stloan); % print the outstanding loan balance
fprintf('The balance of the car loan is %.2f\n',carloan);
%fprintf for a car loan
plot(t,xhist,'-k',t,sthist,'-r',t,carhist,'-g'); % plot the account history
leg= legend('current account', 'student loan', 'car loan'); 
set (leg,'Fontsize',12);
xlabel('months (n)', 'Fontsize', 14); 
ylabel('balance(£)', 'Fontsize', 14); 
title('Student Personal Finance','Fontsize',16);

%This shows us that all three accounts will continue to grow. The student
%loan and and the the current account is the linear. Whereas the the car
%loan grows exponentially. The reason for this is because the repayments
%are so small. Additionally there is no restriction on it 

