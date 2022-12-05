numNoUlls = 50;
A = fileread('DataFaces\hashes.txt');
nameList = split(A);

nameList(end)=[];

path = strcat('DataFaces\images\',nameList{1},'.jpg');
prova = imread(path);
prova = imresize(prova,0.25);
imshow(prova);
eyePos = getrect();

output = [];
imageSize = [256,256];



for i = 1:size(nameList)

    path = strcat('DataFaces\images\',nameList{i},'.jpg');
    I1024 = rgb2gray(imread(path));
    I256 = imresize(I1024,0.25);
    ull = createEyeImage(I256, eyePos);

    descriptorUll = extractLBPFeatures(ull);
    featuresLPB = [descriptorUll, 0];

    output = [output ; featuresLPB];

    
    imshow(ull); 

    for j = 1:numNoUlls
        noUll = createNoEyeImage(I256,eyePos);
        descriptorUll = extractLBPFeatures(noUll);
 
        featuresLPB = [descriptorUll, 1];
        output = [output; featuresLPB];
        imshow(noUll); 


    end

    
end


writematrix(output,'LBP.csv')
