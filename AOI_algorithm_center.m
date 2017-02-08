%% LEDA Project: Sharpcon AOI Contact Defect Detection
% *** Writer: Rex Huang, rex.huang@leda-creative.com
% *** Date: 2017/2/8
% *** Object: An algorithm to detect the defects in the optical zone

%% Initialization

%Clear command line, workspace
clc; clear all; 

% Definition
IMAGE_FOLDER = 'C:\LEDA\AOI\Images'; 
BINARIZE_THRESHOLD = 120;
LENS_RADIUS_RANGE = [100 150];

% Add image folder path
addpath(IMAGE_FOLDER); 

% List folder's images
file_listing = dir(IMAGE_FOLDER);

% Functions
% img_binarize(img,threshold)
% img_findRadiusNCenter(img_bin, LENS_RADIUS_RANGE)

%% Main Algorithm for Optical Zone

% num_imgs = length(file_listing) - 2; % There are 2 files that are not the images
num_imgs = 1;

for i = 3 : num_imgs + 2 % Go through all the images
    
    % Read images from the file
    img_ori = imread(file_listing(i).name); 
    % Transform RGB to grayscale
    img_gray = rgb2gray(img_ori);
    % Binarization
    img_bin = img_binarize(img_gray,BINARIZE_THRESHOLD);
    % Find the radius and center of the circle
    [center, radius] = img_findRadiusNCenter(img_bin, LENS_RADIUS_RANGE);
    
    % To-do 
    % 1. Use the center to draw a circle (smaller)
    % 2. Cut the outter part
    % 3. Use BRISK to find the defects
    
    
    
    
    figure(i-2); % Create figure window
    imshow(img_bin); % Display image
end




