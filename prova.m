hog = readmatrix("DataSet.csv");



labelsHOG = hog(:,end);
[m,n] = size(labelsHOG);
labelsHOG = reshape(labelsHOG, [n,m]);

featureHOG = hog(:,(1:end-1));

classifierHOG = fitcecoc(featureHOG, labelsHOG);


input = imread("input.jpg");
I = rgb2gray(input);


% aux = imresize(I, [256,256]);
% imshow(aux);


pos = [512, 512, 512, 258];

img = imcrop(I, pos);
imshow(img)
cortada = imresize(img, [256,256]);
% [featureVector,~] = extractHOGFeatures(I, 'CellSize', [2, 8]);
% imshow(cortada);



% aux = imresize(img, [256,256]);



% R = predict(classifierHOG, featureVector(:,(1:648)));


