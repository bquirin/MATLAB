%Clear workspace and console
clc; 
clear; 

%Read CSV files and import clustering data into matlab 
iris =csvread('H:\My Documents\University\Year 3\Artificial Intelligence- CS3002\Labs\Lab 2\iris.csv');
irisReal =csvread('H:\My Documents\University\Year 3\Artificial Intelligence- CS3002\Labs\Lab 2\iris_real.csv');

%Initialise Weighted Kappa Arrays
kappaArray = zeros(10,1);
aggKappaArray = zeros(10,1);

%Calculate the WK for K means clustering with different values of K
for i=1:10
kmeansIris = kmeans(iris,i)'; %perform k means clustering
kappa = WK(kmeansIris,irisReal'); %calculate weighed kappa for i clusters
disp("K means Weighted Kapppa for " + i + " is " + kappa)
kappaArray(i) = kappa;
end

%Calculate the Euclidean Distances for iris dataset
irisDistance = pdist(iris);

%Select linktype and perform linkage (options: single, complete or average)
linkType = 'average';
irisLink = linkage(irisDistance,linkType);

%Plot dendogram for Iris dataset with linkage
figure('name',"Dendrogram for "+ linkType + " Linkage",'NumberTitle','off');
[H, T] = dendrogram(irisLink);

%Create Scatter Plots for the Linkage with 3 clusters
figure('name',"Scatterplot for " + linkType + " Linkage with clustersize 3",'NumberTitle','off');
group = cluster(irisLink,'maxclust',3);
gscatter(iris(:,1),iris(:,2),group);

%Loop through to caculate the WK for agg clustering where j is the clustersize
for clusterSize=1:10
group = cluster(irisLink,'maxclust',clusterSize);
aggKappa = WK(group',irisReal');
aggKappaArray(clusterSize) = aggKappa;
end 

%Plot Weighted Kappa Graph for agglomerative/ k means clustering 
figure('name','Agglomerative Weighted Kappa Graph','NumberTitle','off'); 
bar(aggKappaArray);
figure('name','K means Weighted Kappa Graph','NumberTitle','off'); 
bar(kappaArray);