hogEntero = readmatrix("DataSetHOG.csv");
hogTrain = hogEntero(1:8160,:); %Datos de train del HOG
hogTest = hogEntero(8161:end,:);%Datos de test del HOG

lbpEntero = readmatrix("DataSetLBP.csv");
lbpTrain = lbpEntero(1:8160,:);%Datos de train del LBP
lbpTest = lbpEntero(8161:end,:);%Datos de test del LBP

labelsHOG = hogTrain(:,end);%labels del HOG
[m,n] = size(labelsHOG);
labelsHOG = reshape(labelsHOG, [n,m]);

labelsLBP = lbpTrain(:,end); %labels del LBP
[m,n] = size(labelsLBP);
labelsLBP = reshape(labelsLBP, [n,m]);



featureLBP = lbpTrain(:,(1:end-1));

featureHOG = hogTrain(:,(1:end-1));

classifierLBP = fitcecoc(featureLBP, labelsLBP); %Clasificador del LBP

classifierHOG = fitcecoc(featureHOG, labelsHOG);%Clasificador del HOG


testFeaturesHOG = hogTest(:,(1:end-1)); %Preparamos la validación del HOG

testLabelsHOG = hogTest(:,end);
[m,n] = size(testLabelsHOG);
testLabelsHOG = reshape(testLabelsHOG, [n,m]);

testFeaturesLBP = lbpTest(:,(1:end-1)); %Preparamos la validación del LBP

testLabelsLBP = lbpTest(:,end);
[m,n] = size(testLabelsLBP);
testLabelsLBP = reshape(testLabelsLBP, [n,m]);



[predictedLabelsHOG,scoresHOG,costHOG] = predict(classifierHOG,testFeaturesHOG);

[predictedLabelsLBP,scoresLBP,costLBP] = predict(classifierLBP,testFeaturesLBP);



confMatHOG = confusionmat(testLabelsHOG, predictedLabelsHOG);


confMatLBP = confusionmat(testLabelsLBP, predictedLabelsLBP);




