%clear workspace and command console
clc; 
clear; 


x = linspace(0,3000,2000)
f1 = (x/1000).^9*1
f5 = ((x/1000).^1)*1
f9 = ((x/1000).^(1/9))*1


figure('name',"F Ratio");
hold on
plot(x,f1)
plot(x,f5)
plot(x,f9)

xlim([500 3000])
ylim([-1 5])
legend('F = 0.1','F = 0.5','F = 0.9')
xlabel('Supply')
ylabel('Price')
title('F Ratio')
grid on
hold off

print -deps epsFig