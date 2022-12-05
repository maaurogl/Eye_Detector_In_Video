function descriptor = createEyeImage(I256, eyePos)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
descriptor = imcrop(I256,eyePos);
end