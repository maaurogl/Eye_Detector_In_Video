function [descriptor] = createDescriptor(I)

[featureVector,~] = extractHOGFeatures(I, 'CellSize', [10, 10]);
descriptor = featureVector;
end