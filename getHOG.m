function [HOG] = getHOG(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[featureVector,HOG] = extractHOGFeatures(img);
end