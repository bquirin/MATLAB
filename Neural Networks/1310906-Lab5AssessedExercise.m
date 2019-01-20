% ================clear workspace and command console====================
clc; 
clear;

%============================== XOR Problem================================
%A limitation of the single layer NN architecture is that it is only capable 
%of separating data points with a single line. This is unfortunate because 
%the XOR inputs are not linearly separable.

%  1     1     0     0
 % 1     0     1     0
%-------------------------
 % 0     1     1     0

%Training perceptron
xorPerceptron = newp([0 1; 0 1], 1);
inputs = [[1;1] [1;0] [0;1] [0;0]]; 
targets = [0 1 1 0];
xorPerceptron=train(xorPerceptron,inputs,targets);
% %Testing perceptron & measuring accuracy
result=sim(xorPerceptron,inputs)
accuracy =mean(result == targets)
% 
% 
% % ========================Multilayer Neural Networks=======================
% % 1    1    -1    -1
% % 1   -1     1    -1
% %---------------------
% % 0    1     1     0
% 
% % The -1 represents T the 1 represents F
% %nntool for graphical representation
multiInputs = [[1;1] [1;-1] [-1;1] [-1;-1]];
multiTargets = [0 1 1 0];
multiLayerNN = newff(multiInputs,multiTargets,2); % 2 layers
multiLayerNN.trainParam.epochs = 300;
multiLayerNN.trainParam.goal = 1e-5; %0.00001 (e = 10^something)
multiLayerNN.divideFcn = ''; %use all inputs
multiLayerNN = train(multiLayerNN, multiInputs, multiTargets);
multiResults = sim(multiLayerNN,multiInputs)>0.5 %set threshold
multiAccuracy =mean(multiResults == multiTargets)


%==========================Wine data assessed exercise=====================
% %Read in wine data excluding column titles
% classes 
wineData = csvread('H:\My Documents\University\Year 3\Artificial Intelligence- CS3002\Labs\Lab 5\winedata2.csv',1);

%spilts the cvs files into to seperate arrays
wineClass = wineData(:,1)-1; % changes class 1 and 2 to class 0 and 1 respectively
wineValues = wineData(:,2:14);

% split training class from the training data
wineTrainClass=wineClass(1:80);
wineTrainValues=wineValues(1:80,:);

% split test class from the test data 
wineTestClass=wineClass(81:130); 
wineTestValues=wineValues(81:130,:); 

%TRANSPOSE VALUES TO MAKE THEM ACCEPTABLE TO THE FUNCTIONS
%Create a new feed forward Neural Network
wineNeuralNetwork=newff(wineTrainValues',wineTrainClass',2);
%wineNeuralNetwork=init(wineNeuralNetwork); %uneccessary

%Set Neural Network Parameters
wineNeuralNetwork.trainParam.epochs = 300;
wineNeuralNetwork.trainParam.goal = 1e-10;
wineNeuralNetwork.divideFcn = '';

%train the neural network 
wineNeuralNetwork = train(wineNeuralNetwork, wineTrainValues',wineTrainClass');

%Run the test
result = sim(wineNeuralNetwork,wineTestValues')>0.5;
accuracy = mean(result==wineTestClass')





