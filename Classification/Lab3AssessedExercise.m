%clear workspace and command console
clc; 
clear; 

%Read in iris_merged dataset and randomised(iris and iris_real)
irisMerged = csvread('H:\Documents\Artificial Intelligence- CS3002\Labs\Lab 3\iris_merged.csv'); 

%==============Task 1: Learn a decision tree for all 3 classes of iris====

%split iris file into 2 pieces(class and values)
%Take the first column from the iris dataset and save them as our classes
irisclass = irisMerged(:,1);
%Take the last 3 columns and saves them as our values
irisvalues = irisMerged(:,2:5);

%Seperate the Training values and the Test Values 
%Use the first 100 values as our training data
iristrainclass=irisclass(1:100);
iristrainvalues=irisvalues(1:100,:);

%Use the last 50 values as our test data
iristestclass=irisclass(101:150);
iristestvalues=irisvalues(101:150,:);

%Create decision tree and view it
iristree = fitctree(iristrainvalues, iristrainclass);
view(iristree, 'Mode', 'graph');

%==============Task 2: Prune decision tree & test accuracy================

%Use pruning and test accuracy 
iristree2=prune(iristree,'Level', 1); %degree 1 shows all 3 classes
view(iristree2, 'Mode', 'graph'); 
iristreeeval = predict(iristree2, iristestvalues);
decisionAccuracy = iristestclass == iristreeeval; 
decisionAccuracy = mean(decisionAccuracy)


%============================Task 3: Scatterplot==========================

decisionTree = predict(iristree,iristestvalues);
figure('name',"Scatterpot for decision tree",'NumberTitle','off');
gscatter(iristestvalues(:,1),iristestvalues(:,2),decisionTree);

%==============================Task 4: KNN=================================

k=3; 
irisknn = fitcknn(iristrainvalues, iristrainclass, 'NumNeighbors', k,'Distance', 'euclidean');%cosine correlation 
class = predict(irisknn, iristestvalues); 
knnAccuracy = iristestclass == class;
knnAccuracy = mean(knnAccuracy)
