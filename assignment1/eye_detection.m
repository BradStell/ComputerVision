% Please edit this function only, and submit this Matlab file in a zip file
% along with your PDF report

function [left_x, right_x, left_y, right_y] = eye_detection(img)
% INPUT: RGB image
% OUTPUT: x and y coordinates of left and right eye.
% Please rewrite this function, and submit this file in Moodle (in a zip file with the report). 

eyeFilter = imread('eyetemplate.jpg');
grayFilter = rgb2gray(eyeFilter);

grayImage = rgb2gray(img);
filteredImage = imfilter(im2double(grayImage), im2double(grayFilter));

imshow(uint8(filteredImage));
pause;

% have no idea what to do here

left_x = 100;
right_x = 300;
left_y = 50;
right_y = 50;

end