function descriptor = createNoEyeImage(I256,eyePos)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x = rand()*(256-eyePos(3));
y = rand()*(256-eyePos(4));
while ((x>eyePos(1)-eyePos(3)) && (x<eyePos(1)+eyePos(3)) && (y>eyePos(2)-eyePos(4)) && (y<eyePos(2)+eyePos(4)))
    x = rand()*(256-eyePos(3));
    y = rand()*(256-eyePos(4));
end
noEyePos = [x, y, eyePos(3), eyePos(4)];
descriptor = imcrop(I256,noEyePos);
end