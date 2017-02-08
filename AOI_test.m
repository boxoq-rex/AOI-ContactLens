%% init
clc; clear all;

% defines
IMAGE_FOLDER = 'img';
LENS_RADIUS_RANGE = [100 150];

addpath(IMAGE_FOLDER);  % add image folder path
file_listing = dir(IMAGE_FOLDER);

%% main algorithm

% num_imgs = length(file_listing) - 2;
num_imgs = 3;

for i = 3 : num_imgs
    % read file
    img_ori = imread( file_listing(i+2).name );
    
    img_gray = rgb2gray(img_ori);       % convert to grayscale
    img_bin = imbinarize(img_gray);     % convert to binary
    img_bin = imcomplement(img_bin);    % inverse the image
    img_bin = imfill( img_bin, 'holes' );   % fill the circle
    
    % find circle using "imfindcircles" (hough transform), not sure why it
    % only works with smaller images, so downsample it first
    img_down5 = imresize( img_bin, 0.2 );
    [centers, radii, metric] = imfindcircles( img_down5, LENS_RADIUS_RANGE);
    viscircles(centers, radii,'EdgeColor','b');
    
    % get actual circle center and radius
    center = centers * 5;
    radius = radii * 5;
    
    % draw circle on image
    RGB = insertShape(img_ori,'circle',[center(1) center(2) radius(1)],'LineWidth',2);
    imshow(RGB)
end
