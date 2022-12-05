numNoUlls = 50;
A = fileread('DataFaces\hashes.txt');
nameList = split(A);

nameList(end)=[];

path = strcat('DataFaces\images\',nameList{1},'.jpg');
prova = imread(path);
prova = imresize(prova,0.25);
imshow(prova);
eyePos = getrect();



imageSize = [256,256];

outputHOG = single(zeros(200*51, 1081));
outputLBP = single(zeros(200*51, 1081));


for i = 1:size(nameList)
    
    path = strcat('DataFaces\images\',nameList{i},'.jpg');
    I1024 = rgb2gray(imread(path));
    I256 = imresize(I1024,0.25);
    ull = createEyeImage(I256, eyePos);

    descriptorUll = createDescriptor(ull); 
    featuresHOG = [descriptorUll, 0];
    outputHOG((i-1)*51+1, :) = featuresHOG;

    

    descriptorUll = extractLBPFeatures(ull);
    featuresLBP = [descriptorUll, 0];
    outputLBP((i-1)*51+1, :) = featuresLBP;
    


    imshow(ull); 

    for j = 1:numNoUlls
        
        noUll = createNoEyeImage(I256,eyePos);

        descriptorNoUll = createDescriptor(noUll);
        featuresHOG = [descriptorNoUll, 1];
        outputHOG((i-1)*51+1+j, : ) = featuresHOG;

        descriptorNoUll = extractLBPFeatures(noUll);
        featuresLBP = [descriptorNoUll, 1];
        outputLBP((i-1)*51+1+j, : ) = featuresLBP;

    end

    
end


writematrix(outputHOG,'DataSetHOG.csv')
writematrix(outputLBP,'DataSetLBP.csv')
