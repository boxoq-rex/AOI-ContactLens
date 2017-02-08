%% Function Name: img_findRadiusNCenter(img)
% Image Radius and Center Searching
% Input: img(It should be a grayscale image.), LENS_RADIUS_RANGE
% Output: 
% Date: 2017/2/8

%% Main Function
function [center,radius] = img_findRadiusNCenter(img, LENS_RADIUS_RANGE)
    
% Inverse the image
img = imcomplement(img);
% Fill the circle
img = imfill( img, 'holes' );

% find circle using "imfindcircles" (hough transform), not sure why it
% only works with smaller images, so downsample it first
img_down5 = imresize( img, 0.2 );
[centers, radii, metric] = imfindcircles( img_down5, LENS_RADIUS_RANGE);
viscircles(centers, radii,'EdgeColor','b');

% get actual circle center and radius
center = centers * 5;
radius = radii * 5;

end